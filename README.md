# proyFisioManager — Documentación del Proyecto

Documentación técnica del sistema **FisioManager** (Equipo 4, Grupo 5CM4),
organizada por fase del proceso de Análisis y Diseño de Sistemas. Cada artefacto
es un documento LaTeX independiente que compila a su propio PDF e incluye su
Carátula de Cambios (Historial de versiones).

## Estructura

```
proyFisioManager/
├── narrativaEq#4.pdf      Narrativa del proyecto (PDF generado)
├── Requerimientos/        Visión, actores/stakeholders y SRS (RF y RNF)
├── ModAnalisis/           Modelo de Análisis (+ figuras, puml y crc_individuales)
├── ModDiseño/             Modelo de Diseño
├── Implementación/        (reservada)
├── VideoEntrega/          (reservada)
├── logos/                 Preámbulo compartido y escudos institucionales
├── narrativa/             Fuente LaTeX de la narrativa
└── Makefile               Compila los cuatro artefactos
```

Las carpetas `crc_individuales/`, `figuras/` y `puml/` viven dentro de
`ModAnalisis/`; el documento de Diseño referencia esas imágenes por ruta relativa.

## Artefactos

| Documento            | Fuente                          | Salida              |
|----------------------|---------------------------------|---------------------|
| Requerimientos       | `Requerimientos/Requerimientos.tex` | `Requerimientos.pdf` |
| Modelo de Análisis   | `ModAnalisis/ModAnalisis.tex`   | `ModAnalisis.pdf`   |
| Modelo de Diseño     | `ModDiseño/ModDiseno.tex`       | `ModDiseno.pdf`     |
| Narrativa            | `narrativa/narrativa.tex`       | `narrativaEq#4.pdf` |

## Compilación

El `Makefile` está dentro de `proyFisioManager/`, así que primero entra a esa carpeta:

```bash
cd proyFisioManager
make                # Compila los cuatro artefactos
make requerimientos # Solo Requerimientos
make analisis       # Solo Modelo de Análisis
make diseno         # Solo Modelo de Diseño
make narrativa      # Narrativa -> narrativaEq#4.pdf
make diagrams       # Regenera los .png desde los .puml
make clean          # Borra temporales de LaTeX
make distclean      # Borra PDFs y diagramas generados
```

Requiere `latexmk` (o `pdflatex`) y, para regenerar diagramas, `plantuml`.

## Repositorio del Proyecto

```bash
git@github.com:AndreaHortaHernandez/FisioManager.git
```
