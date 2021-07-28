################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../libraries/drivers/drv_common.c \
../libraries/drivers/drv_dcmi.c \
../libraries/drivers/drv_gc0328c.c \
../libraries/drivers/drv_gpio.c \
../libraries/drivers/drv_lcd.c \
../libraries/drivers/drv_sdio.c \
../libraries/drivers/drv_sdram.c \
../libraries/drivers/drv_soft_i2c.c \
../libraries/drivers/drv_spi.c \
../libraries/drivers/drv_spi_ili9488.c \
../libraries/drivers/drv_usart.c \
../libraries/drivers/drv_wlan.c 

OBJS += \
./libraries/drivers/drv_common.o \
./libraries/drivers/drv_dcmi.o \
./libraries/drivers/drv_gc0328c.o \
./libraries/drivers/drv_gpio.o \
./libraries/drivers/drv_lcd.o \
./libraries/drivers/drv_sdio.o \
./libraries/drivers/drv_sdram.o \
./libraries/drivers/drv_soft_i2c.o \
./libraries/drivers/drv_spi.o \
./libraries/drivers/drv_spi_ili9488.o \
./libraries/drivers/drv_usart.o \
./libraries/drivers/drv_wlan.o 

C_DEPS += \
./libraries/drivers/drv_common.d \
./libraries/drivers/drv_dcmi.d \
./libraries/drivers/drv_gc0328c.d \
./libraries/drivers/drv_gpio.d \
./libraries/drivers/drv_lcd.d \
./libraries/drivers/drv_sdio.d \
./libraries/drivers/drv_sdram.d \
./libraries/drivers/drv_soft_i2c.d \
./libraries/drivers/drv_spi.d \
./libraries/drivers/drv_spi_ili9488.d \
./libraries/drivers/drv_usart.d \
./libraries/drivers/drv_wlan.d 


# Each subdirectory must supply rules for building sources it contributes
libraries/drivers/%.o: ../libraries/drivers/%.c
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -DDEBUG -I"E:\expression_reco" -I"E:\expression_reco\Middlewares\ST\AI\Inc" -I"E:\expression_reco\X-CUBE-AI\App" -I"E:\expression_reco\X-CUBE-AI" -I"E:\expression_reco\applications" -I"E:\expression_reco\board\CubeMX_Config\Core\Inc" -I"E:\expression_reco\board\port" -I"E:\expression_reco\board" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Device\ST\STM32H7xx\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\STM32H7xx_HAL_Driver\Inc" -I"E:\expression_reco\libraries\drivers\include\config" -I"E:\expression_reco\libraries\drivers\include" -I"E:\expression_reco\libraries\drivers" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\devfs" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\elmfat" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\romfs" -I"E:\expression_reco\rt-thread\components\dfs\include" -I"E:\expression_reco\rt-thread\components\drivers\include" -I"E:\expression_reco\rt-thread\components\drivers\spi" -I"E:\expression_reco\rt-thread\components\finsh" -I"E:\expression_reco\rt-thread\components\libc\compilers\newlib" -I"E:\expression_reco\rt-thread\include" -I"E:\expression_reco\rt-thread\libcpu\arm\common" -I"E:\expression_reco\rt-thread\libcpu\arm\cortex-m7" -I"E:\expression_reco\rt_ai_lib\backend_plugin_stm32" -I"E:\expression_reco\rt_ai_lib\img" -I"E:\expression_reco\rt_ai_lib\include" -I"E:\expression_reco\rt_ai_lib" -include"E:\expression_reco\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

