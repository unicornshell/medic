################################################################################
# �Զ����ɵ��ļ�����Ҫ�༭��
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../rt-thread/components/dfs/src/dfs.c \
../rt-thread/components/dfs/src/dfs_file.c \
../rt-thread/components/dfs/src/dfs_fs.c \
../rt-thread/components/dfs/src/dfs_posix.c \
../rt-thread/components/dfs/src/poll.c \
../rt-thread/components/dfs/src/select.c 

OBJS += \
./rt-thread/components/dfs/src/dfs.o \
./rt-thread/components/dfs/src/dfs_file.o \
./rt-thread/components/dfs/src/dfs_fs.o \
./rt-thread/components/dfs/src/dfs_posix.o \
./rt-thread/components/dfs/src/poll.o \
./rt-thread/components/dfs/src/select.o 

C_DEPS += \
./rt-thread/components/dfs/src/dfs.d \
./rt-thread/components/dfs/src/dfs_file.d \
./rt-thread/components/dfs/src/dfs_fs.d \
./rt-thread/components/dfs/src/dfs_posix.d \
./rt-thread/components/dfs/src/poll.d \
./rt-thread/components/dfs/src/select.d 


# Each subdirectory must supply rules for building sources it contributes
rt-thread/components/dfs/src/%.o: ../rt-thread/components/dfs/src/%.c
	arm-none-eabi-gcc -mcpu=cortex-m7 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -O0 -ffunction-sections -fdata-sections -Wall  -g -gdwarf-2 -DDEBUG -I"E:\expression_reco" -I"E:\expression_reco\Middlewares\ST\AI\Inc" -I"E:\expression_reco\X-CUBE-AI\App" -I"E:\expression_reco\X-CUBE-AI" -I"E:\expression_reco\applications" -I"E:\expression_reco\board\CubeMX_Config\Core\Inc" -I"E:\expression_reco\board\port" -I"E:\expression_reco\board" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Device\ST\STM32H7xx\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\CMSIS\Include" -I"E:\expression_reco\libraries\STM32H7xx_HAL\STM32H7xx_HAL_Driver\Inc" -I"E:\expression_reco\libraries\drivers\include\config" -I"E:\expression_reco\libraries\drivers\include" -I"E:\expression_reco\libraries\drivers" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\devfs" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\elmfat" -I"E:\expression_reco\rt-thread\components\dfs\filesystems\romfs" -I"E:\expression_reco\rt-thread\components\dfs\include" -I"E:\expression_reco\rt-thread\components\drivers\include" -I"E:\expression_reco\rt-thread\components\drivers\spi" -I"E:\expression_reco\rt-thread\components\finsh" -I"E:\expression_reco\rt-thread\components\libc\compilers\newlib" -I"E:\expression_reco\rt-thread\include" -I"E:\expression_reco\rt-thread\libcpu\arm\common" -I"E:\expression_reco\rt-thread\libcpu\arm\cortex-m7" -I"E:\expression_reco\rt_ai_lib\backend_plugin_stm32" -I"E:\expression_reco\rt_ai_lib\img" -I"E:\expression_reco\rt_ai_lib\include" -I"E:\expression_reco\rt_ai_lib" -include"E:\expression_reco\rtconfig_preinc.h" -std=gnu11 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

