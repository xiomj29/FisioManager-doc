# FisioManager — Documentacion Tecnica (LaTeX)

Documentacion tecnica del sistema FisioManager en formato LaTeX.

## Estructura

```
latex/
├── main.tex                     
├── Makefile                     
├── README.md                    
├── capitulos/                  
│   ├── 00_portada.tex
│   ├── 01_introduccion.tex
│   ├── 02_actores.tex
│   ├── 03_requerimientos.tex   
│   ├── 04_crc_cards.tex         
│   ├── 05_modelo_c4.tex         
│   ├── 06_crr.tex               
│   ├── 07_diagrama_clases.tex
│   ├── 08_diagrama_objetos.tex
│   ├── 09_diagrama_robustez.tex
│   ├── 10_casos_uso.tex
│   ├── 11_ui_maquetas.tex
│   ├── 12_diagrama_estados.tex
│   ├── 13_diagramas_secuencia.tex
│   ├── 14_modelo_erd.tex
│   └── A_anexos_puml.tex
├── crc_individuales/
│   ├── *.png
│   ├── *.puml
│   ├── ...                   
├── figuras/                     
│   ├── FisioManager_C4_Contexto.png
│   ├── FisioManager_C4_Contenedores.png
│   ├── FisioManager_C4_Componentes.png
│   ├── FisioManager_DiagramaClases.png
│   ├── FisioManager_CasosDeUso.png
│   ├── FisioManager_CRC_Cards.png
│   └── maqueta_wellness.png
│   ├── ... 
└── puml/                        
    ├── 01_diagrama_clases.puml
    ├── 02_c4_nivel1_contexto.puml
    ├── 03_c4_nivel2_contenedores.puml
    ├── 04_c4_nivel3_componentes.puml
    ├── 05_diagrama_casos_uso.puml
    └── 06_crc_cards.puml
    ├── ...
```

## Compilacion

### Opcion 1: Make (recomendado)

```bash
make            
make clean      
make distclean  
```

### Opcion 2: latexmk (mejor manejo de pasadas)

```bash
latexmk -pdf main.tex
```

### Opcion 3: pdflatex manual

```bash
pdflatex main.tex
pdflatex main.tex  
pdflatex main.tex   
```

## Repositorio del Proyecto

```bash
git@github.com:AndreaHortaHernandez/FisioManager.git
```

