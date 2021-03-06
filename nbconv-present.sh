#!/bin/bash
# 
# Present jupyter notebook slides with speaker notes and a timer
# 
# Also see slides/slide_template.html.j2 for modifications to the reveal
# template

notebook_path=$1
jupytext --sync $notebook_path
jupyter nbconvert $notebook_path \
    --execute \
    --to=slides \
    --reveal-prefix=reveal.js \
    --SlidesExporter.reveal_theme=simple \
    --SlidesExporter.reveal_transition=none \
    --SlidesExporter.reveal_scroll=True \
    --template-file .jupyter/slide_template.html.j2 \
    --output-dir=slides \
    --TagRemovePreprocessor.remove_input_tags=hide_input \
    --post serve
