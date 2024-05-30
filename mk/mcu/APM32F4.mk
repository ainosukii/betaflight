#
# F4 Make file include
#

#CMSIS
CMSIS_DIR      := $(ROOT)/lib/main/APM32F4/Libraries/Device
STDPERIPH_DIR   = $(ROOT)/lib/main/APM32F4/Libraries/APM32F4xx_DAL_Driver
STDPERIPH_SRC   = $(notdir $(wildcard $(STDPERIPH_DIR)/Source/*.c))
EXCLUDES        = apm32_assert_template.h \
                  apm32f4xx_dal_cfg_template.h \
                  apm32f4xx_device_cfg_template.h \
                  apm32f4xx_dal_timebase_rtc_alarm_template.c \
                  apm32f4xx_dal_timebase_rtc_wakeup_template.c \
                  apm32f4xx_dal_timebase_tmr_template.c \
                  apm32f4xx_device_cfg_template.c

STDPERIPH_SRC   := $(filter-out ${EXCLUDES}, $(STDPERIPH_SRC))

VPATH       := $(VPATH):$(STDPERIPH_DIR)/Src


#ifeq ($(TARGET_MCU),$(filter $(TARGET_MCU),STM32F411xE STM32F446xx))
#EXCLUDES        += apm32f4xx_fsmc.c
#endif


#USB
USBCORE_DIR = $(ROOT)/lib/main/APM32F4/Middlewares/APM32_USB_Library/Device/Core
USBCORE_SRC = $(notdir $(wildcard $(USBCORE_DIR)/Src/*.c))
#EXCLUDES    = usbd_conf_template.c
#USBCORE_SRC := $(filter-out ${EXCLUDES}, $(USBCORE_SRC))

USBCDC_DIR = $(ROOT)/lib/main/APM32F4/Middlewares/APM32_USB_Library/Device/Class/CDC
USBCDC_SRC = $(notdir $(wildcard $(USBCDC_DIR)/Src/*.c))
#EXCLUDES   = usbd_cdc_if_template.c
#USBCDC_SRC := $(filter-out ${EXCLUDES}, $(USBCDC_SRC))

VPATH := $(VPATH):$(USBCDC_DIR)/Src:$(USBCORE_DIR)/Src

DEVICE_STDPERIPH_SRC := $(STDPERIPH_SRC) \
                        $(USBCORE_SRC) \
                        $(USBCDC_SRC)

#CMSIS
#VPATH           := $(VPATH):$(CMSIS_DIR)/Core/Include
VPATH           := $(VPATH):$(ROOT)/lib/main/APM32F4/Libraries/Device/Geehy/APM32F4xx

INCLUDE_DIRS    := $(INCLUDE_DIRS) \
                   $(ROOT)/src/main/drivers/apm32

CMSIS_SRC       :=
INCLUDE_DIRS    := $(INCLUDE_DIRS) \
                   $(SRC_DIR)/startup/apm32 \
                   $(STDPERIPH_DIR)/Include \
                   $(USBCORE_DIR)/Inc \
                   $(USBCDC_DIR)/Inc \
                   $(CMSIS_DIR)/Geehy/APM32F4xx/Include \
                   $(ROOT)/src/main/drivers/apm32/usb/vcp

#Flags
ARCH_FLAGS      = -mthumb -mcpu=cortex-m4 -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 -fsingle-precision-constant

DEVICE_FLAGS    = -DUSE_DAL_DRIVER -DAPM32F405xx -DHSE_VALUE=$(HSE_VALUE) -DAPM32
LD_SCRIPT       = $(LINKER_DIR)/apm32_flash_f405.ld
STARTUP_SRC     = apm32/startup_apm32f40xx.s
MCU_FLASH_SIZE  := 1024

MCU_COMMON_SRC = \
            drivers/accgyro/accgyro_mpu.c \
            drivers/dshot_bitbang_decode.c \
            drivers/inverter.c \
            drivers/pwm_output_dshot_shared.c \
            drivers/apm32/pwm_output_dshot.c \
            drivers/apm32/adc_apm32f4xx.c \
            drivers/apm32/bus_i2c_apm32f4xx.c \
            drivers/apm32/bus_spi_stdperiph.c \
            drivers/apm32/debug.c \
            drivers/apm32/dma_reqmap_mcu.c \
            drivers/apm32/dma_apm32f4xx.c \
            drivers/apm32/dshot_bitbang.c \
            drivers/apm32/dshot_bitbang_stdperiph.c \
            drivers/apm32/exti.c \
            drivers/apm32/io_apm32.c \
            drivers/apm32/light_ws2811strip_stdperiph.c \
            drivers/apm32/persistent.c \
            drivers/apm32/pwm_output.c \
            drivers/apm32/rcc_apm32.c \
            drivers/apm32/sdio_f4xx.c \
            drivers/apm32/serial_uart_stdperiph.c \
            drivers/apm32/serial_uart_apm32f4xx.c \
            drivers/apm32/system_apm32f4xx.c \
            drivers/apm32/timer_stdperiph.c \
            drivers/apm32/timer_apm32f4xx.c \
            drivers/apm32/transponder_ir_io_stdperiph.c \
            drivers/apm32/usbd_msc_desc.c \
            drivers/apm32/camera_control.c \
            startup/system_apm32f4xx.c

VCP_SRC = \
            drivers/apm32/usb/vcp/usbd_descriptor.c \
            drivers/apm32/usb/vcp/usbd_board.c \
            drivers/apm32/usb/vcp/usbd_cdc_vcp.c \
            drivers/apm32/serial_usb_vcp.c \
            drivers/usb_io.c

MSC_SRC = \
            drivers/usb_msc_common.c \
            drivers/apm32/usb_msc_f4xx.c \
            msc/usbd_storage.c \
            msc/usbd_storage_emfat.c \
            msc/emfat.c \
            msc/emfat_file.c \
            msc/usbd_storage_sd_spi.c \
            msc/usbd_storage_sdio.c

DSP_LIB := $(ROOT)/lib/main/CMSIS/DSP
DEVICE_FLAGS += -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1 -DUNALIGNED_SUPPORT_DISABLE -DARM_MATH_CM4
