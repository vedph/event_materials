
# Linking Text and image: TEI XML and IIIF

Paolo Monella

VeDPH Summer Camp 2020

Strand 1: Text

## Plan 

| Lecture (open)   | Workshop (restricted)   | Topic/activity |
| ---------------- | ----------------------- | ------------------ |
| 15.00-15.05      |                         | What is IIIF and what it is for |
| 15.05-15.10      |                         | Let\'s view a manuscript with IIIF |
| 15.10-15.15      | 15.45-15.55             | What\'s under the hood? IIIF JSON metadata files (manifest.json and info.json) |
| 15.15-15.20      | 15.55-16.05             | Let\'s manipulate an image with the IIIF Image API (resizing, cropping, rotating) |
| 15.20-15.25      | 16.05-16.15             | Let\'s link our digital edition to a local image |
| 15.25-15.30      | 16.15-16.30             | \...and to an IIIF image: \<pb/\> to a IIIF canvas, \<lb/\> to a cropped region |


## Materials and instructions

0. [Framasoft shared pad](#)
0. Other learning materials
    1. [Paolo Monella Bologna 2020](https://www1.unipa.it/paolo.monella/reires2019/index.html)
    2. [Paolo Monella and Roberto Rosselli Del Turco AIUCD 2020](https://www1.unipa.it/paolo.monella/aiucd2020/index.html)
    3. [Tiziana Mancinelli Bologna 2020](https://slides.com/tizmancinelli/documenta-amoris#/)
    4. [Summer camp home page](https://vedph.github.io/summercamp/)
    5. [Hacking Mirador](http://darthcrimson.org/hacking-mirador/)
0. What is IIIF? What does it do?
    1. [IIIF](https://iiif.io/) is a protocol (a language shared between computers) to serve images with medatata
    2. Collection of images
        - Presentation API: [documentation](https://iiif.io/api/presentation/2.1/)
        - `manifest.json` metadata file
    3. Individual image (_canvas_)
        - Image API: [documentation](https://iiif.io/api/image/2.1/)
        - `info.json` metadata file
    4. Image API: resizing, cropping etc. happens on the server
        - I can ask for a specific size, region etc. of an image through an URL
        - The server creates an _ad hoc_ image and only returns that
0. What\'s under the hood? IIIF JSON metadata files (manifest.json and
    info.json)
    1. *Manifest*:
        https://iiif.bodleian.ox.ac.uk/iiif/manifest/ae9f6cca-ae5c-4149-8fe4-95e6eca1f73c.json
        (`sequences/0/canvases/26/@id` points to:)
    2. *Canvas*:
        https://iiif.bodleian.ox.ac.uk/iiif/canvas/699adfb3-a5da-4b09-9759-41eee3713bc3.json
        (`images/0/resource/@id` points
        to:)
    3. *Image file*:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3.json
0. Let\'s manipulate an image with the IIIF Image API: full image
    1. Full image (middle-low resolution):
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default
    2. Same as above, with file extension at the end (.jpg):
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default.jp2
    3. Same as above, with file extension at the end (.jpg):
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default.jpg
    4. Same as above, with file extension before (.jp2):
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default
0. IIIF Image API: resizing (size)
    1. Width 200 px:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/200,/0/default
    2. Height 200 px:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/,200/0/default
    3. Squeeze to 50 (width) x 600 (heigth):
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/50,600/0/default
       (see image [size.png](size.png) from this repository)
    5. [Further details](https://iiif.io/api/image/2.1/#size) from the
        API documentation
0. IIIF Image API: cropping (region)
    1. Drawing:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/510,550,3580,3200/full/0/default
    2. Illuminated initial:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/0/default
       (see image [crop.png](crop.png) from this repository)
    3. First line of the rubric (*Ci commence li livres du Grant Caam, qui parole de la grannt Ermenie de Perſſe*):
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/500,3550,3000,140/full/0/default
    4. Second line of the rubric (*et deſ tartars et dŷnde. Et des granz merveille. qui ꝑ le monde ſont*):
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/530,3670,2400,140/full/0/default 
    6. [Further details](https://iiif.io/api/image/2.1/#region) from the API documentation
0. IIIF Image API: quality
    1. Default:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/0/default
    1. Color (same as 'default')
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/0/color
    2. Gray:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/0/gray
    3. Bitonal (black and white):
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/0/bitonal
0. IIIF Image API: rotation
    1. Rotate 90°:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/90/default
    2. Rotation is allowed only for multiples of 90° in this IIIF
       server, so 45° returns an error:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/45/default
    3. Mirroring:
       https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/230,3650,980,1120/full/!0/default
0. Gallica Manuscript (not used in this workshop):
        https://gallica.bnf.fr/ark:/12148/btv1b52000858n/f152.item.zoom
0. Let\'s link our digital edition to a *local* image (from within TEI)
    1. Download image [D23sup.jpg](D23sup.jpg) from this repository
    .  Write this in your TEI code:

            <pb n="D23sup" facs="D23sup.jpg"/>

0. Let\'s visualize our edition linked to a *local* image (we use
    [OxGarage](https://oxgarage.tei-c.org/#) to convert TEI XML to
    HTML). Instructions:
    1. Go to [OxGarage](https://oxgarage.tei-c.org/#)
    2. Left: Convert from → Documents → TEI P5 XML Document
    3. Right: Convert to → xHTML
    4. Left: Select file to convert → Button *Browse/Sfoglia* →
        select and upload your TEI XML file (`mytrascription.xml`)
    5. Right: Upload images → Button *Browse/Sfoglia* → select and
        upload the image with the manuscript page facsimile
    6. Bottom, center: click on button *Convert*
    7. In a few seconds, a download dialog window appears → click
        *Save/Salva* to save the HTML file `mytranscription.html`
    8. Open the downloaded HTML file (double click; your default
        browser will open it)
0. Let\'s link our digital edition to an *IIIF* image:
    1. Linking (from within TEI) \<pb/\> to a whole IIIF JSON manifest:

            <pb n="13r" facs="https://iiif.bodleian.ox.ac.uk/iiif/manifest/ae9f6cca-ae5c-4149-8fe4-95e6eca1f73c.json"/>

    2. Linking \<pb/\> to a specific canvas `info.json`:

            <pb n="13r" facs="https://iiif.bodleian.ox.ac.uk/iiif/canvas/699adfb3-a5da-4b09-9759-41eee3713bc3.json"/>
                        
    3. Linking \<pb/\> to an image *file*:

            <pb n="13r" facs="https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default.jpg"/>
                        
    4. Linking \<lb/\> to an image *region* (first line of the rubric, *Ci commence li livres du Grant Caam*):

            <lb n="13r.1" facs="https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/500,3550,3000,140/full/0/default"/>

## Figures for resizing and cropping
                        
### Figure 1: [size.png](size.png)

![](size.png?raw=true)

### Figure 2: [crop.png](crop.png)

![](crop.png?raw=true)
