################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/adc.c \
../Src/app_bluenrg_ms.c \
../Src/bsp.c \
../Src/gatt_db.c \
../Src/gpio.c \
../Src/hci_tl_interface.c \
../Src/i2c.c \
../Src/main.c \
../Src/myLCD_Driver.c \
../Src/sensor.c \
../Src/stm32f3xx_hal_msp.c \
../Src/stm32f3xx_it.c \
../Src/stm32f3xx_nucleo_bus.c \
../Src/syscalls.c \
../Src/sysmem.c \
../Src/system_stm32f3xx.c 

OBJS += \
./Src/adc.o \
./Src/app_bluenrg_ms.o \
./Src/bsp.o \
./Src/gatt_db.o \
./Src/gpio.o \
./Src/hci_tl_interface.o \
./Src/i2c.o \
./Src/main.o \
./Src/myLCD_Driver.o \
./Src/sensor.o \
./Src/stm32f3xx_hal_msp.o \
./Src/stm32f3xx_it.o \
./Src/stm32f3xx_nucleo_bus.o \
./Src/syscalls.o \
./Src/sysmem.o \
./Src/system_stm32f3xx.o 

C_DEPS += \
./Src/adc.d \
./Src/app_bluenrg_ms.d \
./Src/bsp.d \
./Src/gatt_db.d \
./Src/gpio.d \
./Src/hci_tl_interface.d \
./Src/i2c.d \
./Src/main.d \
./Src/myLCD_Driver.d \
./Src/sensor.d \
./Src/stm32f3xx_hal_msp.d \
./Src/stm32f3xx_it.d \
./Src/stm32f3xx_nucleo_bus.d \
./Src/syscalls.d \
./Src/sysmem.d \
./Src/system_stm32f3xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F302x8 -c -I../Inc -I../Drivers/BSP/STM32F3xx_Nucleo -I../Drivers/STM32F3xx_HAL_Driver/Inc -I../Drivers/STM32F3xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F3xx/Include -I../Drivers/CMSIS/Include -I../Middlewares/ST/BlueNRG-MS/utils -I../Middlewares/ST/BlueNRG-MS/includes -I../Middlewares/ST/BlueNRG-MS/hci/hci_tl_patterns/Basic -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/adc.cyclo ./Src/adc.d ./Src/adc.o ./Src/adc.su ./Src/app_bluenrg_ms.cyclo ./Src/app_bluenrg_ms.d ./Src/app_bluenrg_ms.o ./Src/app_bluenrg_ms.su ./Src/bsp.cyclo ./Src/bsp.d ./Src/bsp.o ./Src/bsp.su ./Src/gatt_db.cyclo ./Src/gatt_db.d ./Src/gatt_db.o ./Src/gatt_db.su ./Src/gpio.cyclo ./Src/gpio.d ./Src/gpio.o ./Src/gpio.su ./Src/hci_tl_interface.cyclo ./Src/hci_tl_interface.d ./Src/hci_tl_interface.o ./Src/hci_tl_interface.su ./Src/i2c.cyclo ./Src/i2c.d ./Src/i2c.o ./Src/i2c.su ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/myLCD_Driver.cyclo ./Src/myLCD_Driver.d ./Src/myLCD_Driver.o ./Src/myLCD_Driver.su ./Src/sensor.cyclo ./Src/sensor.d ./Src/sensor.o ./Src/sensor.su ./Src/stm32f3xx_hal_msp.cyclo ./Src/stm32f3xx_hal_msp.d ./Src/stm32f3xx_hal_msp.o ./Src/stm32f3xx_hal_msp.su ./Src/stm32f3xx_it.cyclo ./Src/stm32f3xx_it.d ./Src/stm32f3xx_it.o ./Src/stm32f3xx_it.su ./Src/stm32f3xx_nucleo_bus.cyclo ./Src/stm32f3xx_nucleo_bus.d ./Src/stm32f3xx_nucleo_bus.o ./Src/stm32f3xx_nucleo_bus.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su ./Src/system_stm32f3xx.cyclo ./Src/system_stm32f3xx.d ./Src/system_stm32f3xx.o ./Src/system_stm32f3xx.su

.PHONY: clean-Src

