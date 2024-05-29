/*
 * This file is part of Betaflight.
 *
 * Betaflight is free software. You can redistribute
 * this software and/or modify this software under the terms of the
 * GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * Betaflight is distributed in the hope that they
 * will be useful, but WITHOUT ANY WARRANTY; without even the implied
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software.
 *
 * If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#ifdef APM32F4

#include "apm32f4xx.h"

#endif // APM32F4

#if defined(APM32F405xx) || defined(APM32F407xx) || defined(APM32F415xx) || defined(APM32F417xx)
#define USE_FAST_DATA

// Chip Unique ID on APM32F405
#define U_ID_0 (*(uint32_t*)0x1fff7a10)
#define U_ID_1 (*(uint32_t*)0x1fff7a14)
#define U_ID_2 (*(uint32_t*)0x1fff7a18)

#ifndef APM32F4
#define APM32F4
#endif

#endif

#define USE_RPM_FILTER
#define USE_DYN_IDLE
#define USE_DYN_NOTCH_FILTER
#define USE_ADC_INTERNAL
#define USE_USB_CDC_HID
#define USE_USB_MSC
#define USE_PERSISTENT_MSC_RTC
#define USE_MCO
#define USE_DMA_SPEC
#define USE_PERSISTENT_OBJECTS
#define USE_LATE_TASK_STATISTICS

#define USE_OVERCLOCK

#define TASK_GYROPID_DESIRED_PERIOD     125 // 125us = 8kHz
#define SCHEDULER_DELAY_LIMIT           10

#define DEFAULT_CPU_OVERCLOCK 0

#define FAST_IRQ_HANDLER

#define DMA_DATA_ZERO_INIT
#define DMA_DATA
#define STATIC_DMA_DATA_AUTO        static

// Data in RAM which is guaranteed to not be reset on hot reboot
#define PERSISTENT                  __attribute__ ((section(".persistent_data"), aligned(4)))

#define DMA_RAM
#define DMA_RW_AXI
#define DMA_RAM_R
#define DMA_RAM_W
#define DMA_RAM_RW

#define USE_TIMER_MGMT
#define USE_TIMER_AF
