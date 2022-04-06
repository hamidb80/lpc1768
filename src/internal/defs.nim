{.push header: "../lib/LPC17xx.h".}

type
  LPC_GPIO_TypeDef* = ptr object
    FIODIR*: uint32
    FIODIRL*, FIODIRH*: uint16
    FIODIR0*, FIODIR1*, FIODIR2*, FIODIR3*: uint8

    RESERVED0*: array[3, uint32]

    FIOMASK*: uint32
    FIOMASKL*, FIOMASKH*: uint16
    FIOMASK0*, FIOMASK1*, FIOMASK2*, FIOMASK3*: uint8

    FIOPIN*: uint32
    FIOPINL*, FIOPINH*: uint16
    FIOPIN0*, FIOPIN1*, FIOPIN2*, FIOPIN3*: uint8

    FIOSET*: uint32
    FIOSETL*, FIOSETH*: uint16
    FIOSET0*, FIOSET1*, FIOSET2*, FIOSET3*: uint8

    FIOCLR*: uint32
    FIOCLRL*, FIOCLRH*: uint16
    FIOCLR0*, FIOCLR1*, FIOCLR2*, FIOCLR3*: uint8

  LPC_GPIOINT_TypeDef* = ptr object
    IntStatus*, IO0IntStatR*, IO0IntStatF*,
      IO0IntClr*, IO0IntEnR*, IO0IntEnF*,
      IO2IntStatR*, IO2IntStatF*, IO2IntClr*,
      IO2IntEnR*, IO2IntEnF*: uint32
    RESERVED0*: array[3, uint32]


{.push nodecl.}

var
  P0* {.importc: "LPC_GPIO0".}: LPC_GPIO_TypeDef
  P1* {.importc: "LPC_GPIO1".}: LPC_GPIO_TypeDef
  P2* {.importc: "LPC_GPIO2".}: LPC_GPIO_TypeDef
  P3* {.importc: "LPC_GPIO3".}: LPC_GPIO_TypeDef
  P4* {.importc: "LPC_GPIO4".}: LPC_GPIO_TypeDef
  LPC_GPIOINT*: LPC_GPIOINT_TypeDef

{.pop.}


#ifndef __BSP_H
#define __BSP_H

#define BRD_ADC_CHANNEL					(ADC_CHANNEL_2)
#define BRD_ADC_INTR					(ADC_ADINTEN2)

#define BRD_ADC_CH_PORT					(0)
#define BRD_ADC_CH_PIN					(25)
#define BRD_ADC_CH_FUNC_NO				(1)


# define BRD_LED_1_PORT					LPC_GPIO0
# define BRD_LED_1_PIN					(20)
# define BRD_LED_1_MASK					(1 << BRD_LED_1_PIN)

# define BRD_LED_2_PORT					LPC_GPIO0
# define BRD_LED_2_PIN					(21)
# define BRD_LED_2_MASK					(1 << BRD_LED_2_PIN)

# define BRD_LED_3_PORT					LPC_GPIO0
# define BRD_LED_3_PIN					(22)
# define BRD_LED_3_MASK					(1 << BRD_LED_3_PIN)

# define BRD_LED_4_PORT					LPC_GPIO0
# define BRD_LED_4_PIN					(23)
# define BRD_LED_4_MASK					(1 << BRD_LED_4_PIN)


# // BTN
#define BRD_BTN_1_PORT					LPC_GPIO0
#define BRD_BTN_1_PIN					(16)
#define BRD_BTN_1_MASK					(1 << BRD_BTN_1_PIN)

#define BRD_BTN_2_PORT					LPC_GPIO0
#define BRD_BTN_2_PIN					(17)
#define BRD_BTN_2_MASK					(1 << BRD_BTN_2_PIN)

#define BRD_BTN_3_PORT					LPC_GPIO0
#define BRD_BTN_3_PIN					(18)
#define BRD_BTN_3_MASK					(1 << BRD_BTN_3_PIN)

#define BRD_BTN_4_PORT					LPC_GPIO0
#define BRD_BTN_4_PIN					(19)
#define BRD_BTN_4_MASK					(1 << BRD_BTN_4_PIN)