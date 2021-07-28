################################################################################
# �Զ����ɵ��ļ�����Ҫ�༭��
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/libcpu/arm/common/backtrace.c \
../rt-thread/libcpu/arm/common/div0.c \
../rt-thread/libcpu/arm/common/showmem.c 

OBJS += \
./rt-thread/libcpu/arm/common/backtrace.o \
./rt-thread/libcpu/arm/common/div0.o \
./rt-thread/libcpu/arm/common/showmem.o 

C_DEPS += \
./rt-thread/libcpu/arm/common/backtrace.d \
./rt-thread/libcpu/arm/common/div0.d \
./rt-thread/libcpu/arm/common/showmem.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/libcpu/arm/common/%.o: ../rt-thread/libcpu/arm/common/%.c
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -DDEBUG -I"E:\expression_reco" -I"E:\expression_reco\Middlewares\ST\AI\Inc" -I"E:\expression_reco\X-CUBE-AI\App" -I"E:\expression_reco\X-CUBE-AI" -I"E:\expression_reco\applications" -I"E:\expression_reco\board\CubeMX_Config\Core\Inc" -I"E:\expression_reco\board\port" -I"E:\expression_reco\board" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Device\ST\STM32H7xx\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\STM32H7xx_HAL_Driver\Inc" -I"E:\expression_reco\libraries\drivers\include\config" -I"E:\expression_reco\libraries\drivers\include" -I"E:\expression_reco\libraries\drivers" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\devfs" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\elmfat" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\romfs" -I"E:\expression_reco\rt-thread\components\dfs\include" -I"E:\expression_reco\rt-thread\components\drivers\include" -I"E:\expression_reco\rt-thread\components\drivers\spi" -I"E:\expression_reco\rt-thread\components\finsh" -I"E:\expression_reco\rt-thread\components\libc\compilers\newlib" -I"E:\expression_reco\rt-thread\include" -I"E:\expression_reco\rt-thread\libcpu\arm\common" -I"E:\expression_reco\rt-thread\libcpu\arm\cortex-m7" -I"E:\expression_reco\rt_ai_lib\backend_plugin_stm32" -I"E:\expression_reco\rt_ai_lib\img" -I"E:\expression_reco\rt_ai_lib\include" -I"E:\expression_reco\rt_ai_lib" -include"E:\expression_reco\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"
