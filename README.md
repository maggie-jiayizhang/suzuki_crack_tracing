# suzuki_crack_tracing

This is the README file for a Crack Tracing algorithm designed for img in suzuki 2020.
By Maggie Zhang, MGRGX20

LANGUAGE: MATLAB

For more info + doc:
https://docs.google.com/document/d/19VloN7BrtaRdAaxrYXAAJ4M6lErzpptEheu-elLCJMM/edit?usp=sharing

## DIRECTORY DESCRIPTION ##

 `suzuki_path
    - original.png: original img from suzuki et al. 2020
    - a.png: cropped img a from original.png
    - a_edited.png: manually edited a.png to hide noise signal at the bottom
      (Note: this step is not necessary!)

    - code.m: the whole pipeline
    - score_path.m: contains score_path()
    - generate_path.m: contains generate_path()
    - remove_by_area.m: contains remove_by_area, optional denoise func

    \
     `-outputs: preview of outputs in the pipeline + manually traced image


## NOTES ##
You can run code.m in MATLAB. 4 figures will be opened at the end to show the outputs at different stages in the pipeline. A percentage signal/non-signal on the marked line will also be presented (in the title of the final figure/printed to console).

Currently the pipeline is set to run on both the skeletonized and the b&w (non-skeletonized) image. You can comment out the code block (in Method1 or Method2) to run only the portion you want.




