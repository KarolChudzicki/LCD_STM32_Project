#include "myLCD_Driver.h"
#include "main.h"
#include <stdbool.h>
#include "i2c.h"
#include "gpio.h"
#include <unistd.h> //Usleep
#include <string.h>




HAL_StatusTypeDef res;
uint8_t cursor;

void LCD1602_Init(void) {
	//======Function set x3======
	//Instruction sets the interface data to 8bits
	LCD1602_WriteInst(0b00110000);
	HAL_Delay(5);
	LCD1602_WriteInst(0b00110000);
	HAL_Delay(1);
	LCD1602_WriteInst(0b00110000);
	HAL_Delay(1);
	//======Function set======
	//Instruction sets the interface data to 4bits
	LCD1602_WriteInst(0b00100000);
	HAL_Delay(1);
	//======Function set======
	//Instruction that sets the interface data to 4bits,
	//number of display lines to 2 and character font to 5x7 dots
	LCD1602_WriteInst(0b00101000);
	HAL_Delay(1);
	//======Display ON/OFF control======
	//Instruction turns off the display
	LCD1602_WriteInst(0b00001000);
	HAL_Delay(1);
	//======Clear display======
	//Instruction clears the display and returns cursor to home position
	LCD1602_WriteInst(0b00000001);
	HAL_Delay(1);
	//======Entry mode set======
	//Instruction sets cursor move direction to increment
	//and doesn't initialize display shift
	LCD1602_WriteInst(0b00000110);
	HAL_Delay(1);
	//======Display ON/OFF control======
	//Instruction turns on the display, turns off the cursor
	//and turns off blinking of the cursor
	LCD1602_WriteInst(0b00001100);
	HAL_Delay(1);
	cursor = 0;
}

void LCD1602_Clear(void) {
	LCD1602_WriteInst(0b00000001);
	HAL_Delay(1);
	cursor = 0;
}

void LCD1602_ResetCursor(void) {
	LCD1602_WriteInst(0b00000011);
	HAL_Delay(1);
	cursor = 0;
}

void LCD1602_MoveCursorTo(uint8_t place, uint8_t line) {
	//Check if place is between possible boundaries
	if(place >= 0 && place <= 15 && (line == 1 || line == 2)) {
		//Cursor is before or equal to the declared place in the first line
		if(place + 40*(line-1) - cursor >= 0) {
			for(int i = 0; i <  place + 40*(line-1) - cursor; i++) {
				LCD1602_WriteInst(0b00010100);
				HAL_Delay(1);
			}
			cursor = place + 40*(line-1);
		}
		//Cursor is after the declared place in the first line
		else if(place + 40*(line-1) - cursor < 0) {
			for(int i = 0; i < cursor - (place + 40*(line-1)); i++) {
				LCD1602_WriteInst(0b00010000); //Changes 3 bit to 0 so it shifts to the left
				HAL_Delay(1);
			}
			cursor = place + 40*(line-1);
		}

	}
}


void LCD1602_WriteLetter(char data) {
	char data_up, data_low;
	uint8_t data_t[4];
	data_up = (data & 0b11110000);
	data_low = ((data<<4) & 0b11110000);
	data_t[0] = data_up	| 0b00001101;  // backlight, enable, write, register select
	data_t[1] = data_up	| 0b00001001;
	data_t[2] = data_low| 0b00001101;
	data_t[3] = data_low| 0b00001001;

	HAL_I2C_Master_Transmit(&hi2c1, PCF8574T_ADDRESS, data_t, 4, 1000);
	cursor++;
}

void LCD1602_WriteText(char text[]) {
	for(int i = 0; i < strlen(text); i++) {
		LCD1602_WriteLetter(text[i]);
	}
}

void LCD1602_WriteInst(uint8_t data) {
	char data_up, data_low;
	uint8_t data_t[4];
	data_up = (data & 0b11110000);
	data_low = ((data<<4) & 0b11110000);
	data_t[0] = data_up	| 0b00001100;  // backlight, enable, write, register select
	data_t[1] = data_up	| 0b00001000;
	data_t[2] = data_low| 0b00001100;
	data_t[3] = data_low| 0b00001000;

	HAL_I2C_Master_Transmit(&hi2c1, PCF8574T_ADDRESS, data_t, 4, 1000);
}
