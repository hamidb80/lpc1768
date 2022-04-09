{.push header: "LPC17xx.h".}

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
  PIntr* {.importc: "LPC_GPIOINT".}: LPC_GPIOINT_TypeDef

{.pop.}
{.pop.}

{.push header: "core_cm3.h".}

type
  IRQn* = enum
    Reset_IRQn = -15
    NonMaskableInt_IRQn = -14
    HardFault_IRQn = -13
    MemoryManagement_IRQn = -12
    BusFault_IRQn = -11
    UsageFault_IRQn = -10
    SVCall_IRQn = -5
    DebugMonitor_IRQn = -4
    PendSV_IRQn = -2
    SysTick_IRQn = -1

    WDT_IRQn = 0
    TIMER0_IRQn = 1
    TIMER1_IRQn = 2
    TIMER2_IRQn = 3
    TIMER3_IRQn = 4
    UART0_IRQn = 5
    UART1_IRQn = 6
    UART2_IRQn = 7
    UART3_IRQn = 8
    PWM1_IRQn = 9
    I2C0_IRQn = 10
    I2C1_IRQn = 11
    I2C2_IRQn = 12
    SPI_IRQn = 13
    SSP0_IRQn = 14
    SSP1_IRQn = 15
    PLL0_IRQn = 16
    RTC_IRQn = 17
    EINT0_IRQn = 18
    EINT1_IRQn = 19
    EINT2_IRQn = 20
    EINT3_IRQn = 21
    ADC_IRQn = 22
    BOD_IRQn = 23
    USB_IRQn = 24
    CAN_IRQn = 25
    DMA_IRQn = 26
    I2S_IRQn = 27
    ENET_IRQn = 28
    RIT_IRQn = 29
    MCPWM_IRQn = 30
    QEI_IRQn = 31
    PLL1_IRQn = 32
    USBActivity_IRQn = 33
    CANActivity_IRQn = 34


proc enableInterrupt*(c: IRQn) {.importc: "NVIC_EnableIRQ".}

{.pop.}
