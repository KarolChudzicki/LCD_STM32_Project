/*
 * myLCD_Driver.h
 *
 *  Created on: Apr 26, 2024
 *      Author: oem
 */

#ifndef MYLCD_DRIVER_H_
#define MYLCD_DRIVER_H_

//For I2C and HAL functionality
#include "stm32f3xx_hal.h"
#include <stdbool.h>
#include "i2c.h"
#include "gpio.h"
#include "main.h"
//Default address of the expander, write mode, we won't use read mode
#define PCF8574T_ADDRESS 0x4E

//Structure that holds a pointer to I2C Handle and address of the device



void LCD1602_Init();
void LCD1602_Clear();
void LCD1602_ResetCursor();
void LCD1602_WriteLetter(char data);
void LCD1602_WriteText(char text[]);
void LCD1602_WriteInst(uint8_t data);
void LCD1602_MoveCursorTo(uint8_t place, uint8_t line);

#endif /* MYLCD_DRIVER_H_ */
