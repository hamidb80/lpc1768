{.push header: "lib/LPC17xx.h".}

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


{.push importc, nodecl.}

var
  LPC_GPIO0*: LPC_GPIO_TypeDef
  LPC_GPIO1*: LPC_GPIO_TypeDef
  LPC_GPIO2*: LPC_GPIO_TypeDef
  LPC_GPIO3*: LPC_GPIO_TypeDef
  LPC_GPIO4*: LPC_GPIO_TypeDef
  LPC_GPIOINT*: LPC_GPIOINT_TypeDef

{.pop.}
