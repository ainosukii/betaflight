/*
 * This file is part of Betaflight.
 *
 * Betaflight is free software. You can redistribute this software
 * and/or modify this software under the terms of the GNU General
 * Public License as published by the Free Software Foundation,
 * either version 3 of the License, or (at your option) any later
 * version.
 *
 * Betaflight is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public
 * License along with this software.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#define FC_TARGET_MCU     STM32F7X2

#define BOARD_NAME        NERO
#define MANUFACTURER_ID   BKMN

#define USE_ACC_SPI_MPU6500
#define USE_GYRO_SPI_MPU6500

#define LED0_PIN             PB6
#define LED1_PIN             PB5
#define LED2_PIN             PB4
#define BEEPER_PIN           PC1
#define I2C1_SCL_PIN         PB8
#define I2C1_SDA_PIN         PB9
#define SPI1_SCK_PIN         PA5
#define SPI1_MISO_PIN        PA6
#define SPI1_MOSI_PIN        PA7
#define SPI2_SCK_PIN         PB13
#define SPI2_MISO_PIN        PB14
#define SPI2_MOSI_PIN        PB15
#define SPI3_SCK_PIN         PC10
#define SPI3_MISO_PIN        PC11
#define SPI3_MOSI_PIN        PC12
#define GYRO_1_CS_PIN        PC4
#define GYRO_1_EXTI_PIN      PB15
#define SDCARD_CS_PIN        PA15
#define SDCARD_DETECT_PIN    PD2
#define MOTOR1_PIN           PA0
#define MOTOR2_PIN           PA1
#define MOTOR3_PIN           PA2
#define MOTOR4_PIN           PA3
#define LED_STRIP_PIN        PB0
#define RX_PPM_PIN           PC7
#define UART1_TX_PIN         PA9
#define UART1_RX_PIN         PA10
#define UART3_TX_PIN         PB10
#define UART3_RX_PIN         PB11
#define UART6_TX_PIN         PC6
#define UART6_RX_PIN         PC7
#define ADC_VBAT_PIN         PC3
#define ESCSERIAL_PIN        PC7
#define SDCARD_CS_PIN        PA15
#define SDCARD_DETECT_PIN    PD2

#define TIMER_PIN_MAPPING \
    TIMER_PIN_MAP( 0, PA0 , 2,  0) \
    TIMER_PIN_MAP( 1, PA1 , 2,  0) \
    TIMER_PIN_MAP( 2, PA2 , 2, -1) \
    TIMER_PIN_MAP( 3, PA3 , 2, -1) \
    TIMER_PIN_MAP( 4, PB0 , 2,  0) \
    TIMER_PIN_MAP( 5, PB1 , 2,  0) \
    TIMER_PIN_MAP( 6, PC7 , 2, -1) \
    TIMER_PIN_MAP( 7, PC8 , 2, -1) \
    TIMER_PIN_MAP( 8, PC9 , 2, -1) \



#define ADC1_DMA_OPT        1

//TODO #define DSHOT_BURST ON
#define BEEPER_INVERTED
#define USE_SPI_GYRO
#define GYRO_1_SPI_INSTANCE SPI1
#define GYRO_1_ALIGN CW0_DEG
//TODO #define SDCARD_DETECT_INVERTED ON
#define USE_SDCARD_SPI
#define SDCARD_SPI_INSTANCE SPI3
//TODO #define BATTERY_METER ADC
