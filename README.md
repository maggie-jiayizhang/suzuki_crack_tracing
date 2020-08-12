# suzuki_crack_tracing

http://github.com - automatic!
[GitHub](http://github.com)

This is a crack tracing project (primarily for images in [Suzuki et al. 2020] (https://doi.org/10.1038/s42003-020-0860-1), see images in inputs/) by Maggie Zhang, MGRGX20.

**LANGUAGE: MATLAB**

**Key words**: Dynamic programming (DP), Suzuki et al. 2020, geoscience

## Usage
For an input fluorescent microscopy image of stained microbes (pre-cropped), this pipeline first turns the image to black&white. Further denoising is optional at this point. Then the pipeline either proceed with/out skeletonizing the image. *A line marking the edge of the crack (OR where most microbial signal density) is present* will be generated as one of the end results of the pipeline. The pipeline also calculates *%signal:non-signal* on the line as well as *ratio of area intersecting the line/total signal area*.

For high level explanation of how the algorithm works, go to this [google doc].
(https://docs.google.com/document/d/19VloN7BrtaRdAaxrYXAAJ4M6lErzpptEheu-elLCJMM/edit?usp=sharing)

## Directory Description

- **suzuki_crack_tracing**
    - **inputs**
        - a.png: cropped img a from original.png
        - a_edited.png: manually edited a.png to hide noise signal at the bottom
          (Note: this step is not necessary)
    - *suzuki.m*: the whole pipeline
    - *score_path.m*: defines score_path()
    - *generate_path.m*: defines generate_path()
    - *get_area.m*: defines get_area(), helper function
    - *find_intersect.m*: defines find_intersect()
    - *remove_by_area.m*: defines remove_by_area, optional denoise func
    - **outputs**: preview of outputs in the pipeline + manually traced image
    - original.png: original img from Suzuki et al. 2020

## Notes
1. You can run suzuki.m in MATLAB with
    $ suzuki

2. You will need to replace the image path on line 4 of *suzuki.m* to process the image you want.

3. 4 figures will be opened at the end to show the outputs at different stages in the pipeline. Toggle the code blocks for visualization off if any figure is not needed.

4. Currently the pipeline is set to run on both the skeletonized and the b&w (non-skeletonized) image. You can comment out/toggle the code block (in Method1 or Method2) to run only the portion you want.

5. Calculation are printed to MATLAB window automatically.
