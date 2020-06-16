
# Linking Text and image: TEI XML and IIIF

Paolo Monella,
VeDPH Summer Camp 2020,
Text 1: Strand

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
0. Documentation
    1. [IIIF Presentation API documentation](https://iiif.io/api/presentation/2.1/)
        (manifest.json)
    2. [IIIF Image API documentation](https://iiif.io/api/image/2.1/)
        (info.json)
0. OLD/NEW
    1. OLD canvas: 699adfb3-a5da-4b09-9759-41eee3713bc3
    1. NEW canvas: 699adfb3-a5da-4b09-9759-41eee3713bc3
    https://iiif.bodleian.ox.ac.uk/iiif/canvas/699adfb3-a5da-4b09-9759-41eee3713bc3.json"
0. What\'s under the hood? IIIF JSON metadata files (manifest.json and
    info.json)
    1. *Manifest*:
        https://iiif.bodleian.ox.ac.uk/iiif/manifest/ae9f6cca-ae5c-4149-8fe4-95e6eca1f73c.json
        (`sequences/0/canvases/26/@id` points to:)
    2. *Canvas*:
        https://iiif.bodleian.ox.ac.uk/iiif/canvas/699adfb3-a5da-4b09-9759-41eee3713bc3.json
        (`images/0/resource/@id` points
        to:)
    3. *Image*:
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
    4. [Further details](https://iiif.io/api/image/2.1/#size) from the
        API documentation
0. IIIF Image API: cropping (region)
    1. Illuminated initial:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/200,200,1200,1600/full/0/default
    2. First line:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/default
    3. [Further details](https://iiif.io/api/image/2.1/#region) from
        the API documentation
0. IIIF Image API: quality
    1. Default:
        [http://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/default](https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/default)
    1. Color (same as 'default')
        http://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/color
    2. Gray
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/gray
    3. Bitonal (black and white)
        http://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/bitonal
0. IIIF Image API: rotation
    1. Rotate 90°:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/90/default
    2. Rotation is allowed only for multiples of 90° in this IIIF
        server, so 45° returns an error:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/45/default
    3. Mirroring:
        https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/!0/color
0. Gallica Manuscript (not used in this workshop):
        https://gallica.bnf.fr/ark:/12148/btv1b52000858n/f152.item.zoom
0. Let\'s link our digital edition to a *local* image (from within TEI)
    1. Download image [D23sup.jpg](img/D23sup.jpg)
    .  Write this in your TEI code:

            <pb n="D23sup" facs="D23sup.jpg"/>

0. Let\'s visualize our edition linked to a *local* image (we use
    [OxGarage](https://oxgarage.tei-c.org/#) to convert TEI XML to
    HTML). Instructions:
    1. Go to [OxGarage](https://oxgarage.tei-c.org/#)
    2. Left: Convert from → Documents → TEI P5 XML Document
    3. Right: Convert to → xHTML
    4. Left: Select file to convert → Button *Browse*/*Sfoglia* →
        select and upload your TEI XML file (`mytrascription.xml`)
    5. Right: Upload images → Button *Browse*/*Sfoglia* → select and
        upload the image with the manuscript page facsimile
    6. Bottom, center: click on button *Convert*
    7. In a few seconds, a download dialog window appears → click
        *Save*/*Salva* to save the HTML file `mytranscription.html`
    8. Open the downloaded HTML file (double click; your default
        browser will open it)
0. Let\'s link our digital edition to an *IIIF* image:
    1. Linking (from within TEI) \<pb/\> to a whole IIIF JSON manifest:

            <pb n="13r" facs="http://213.21.172.53/manifests/public/0b002711800e7d6d.json"/>

    2. Linking \<pb/\> to a specific canvas (folio) within the IIIF
        JSON manifest:

            <pb n="13r" facs="http://213.21.172.53/manifests/public/0b002711800e7d6d.json#/sequences/0/canvases/35"/>
                        
    3. Linking \<pb/\> to an image *file*:

            <pb n="13r" facs="https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/full/full/0/default.jpg"/>
                        
    4. Linking \<lb/\> to an image *region* (fist line):

            <lb n="13r.1" facs="https://iiif.bodleian.ox.ac.uk/iiif/image/699adfb3-a5da-4b09-9759-41eee3713bc3/1300,580,900,160/full/0/default"/>
                        

## Useful links

### XML editors: making writing XML code easier

- [Oxygen XML Editor](https://www.oxygenxml.com): [professional,
    standard in TEI community, paid (with trial period), complete until
    HTML transformation]
- [XML Copy
    Editor](https://sourceforge.net/projects/xml-copy-editor/): [open
    source, free, installation]
- [Online XML
    Editor](https://www.tutorialspoint.com/online_xml_editor.htm): [for
    this workshop only, no installation]

### Tools to process TEI XML for visualization

- [Oxygen XML Editor](https://www.oxygenxml.com) (see above)
- [EVT](http://evt.labcd.unipi.it/) (Edition Visualization Technology)
- [OxGarage](https://oxgarage.tei-c.org/#): convert TEI XML to HTML
    for visualization
- [TEI Critical Apparatus Toolbox](http://teicat.huma-num.fr/)
    - [Display parallel
        versions](http://teicat.huma-num.fr/witnesses.php): [synoptic
        visualization of textual variants]
    - [Check your encoding](http://teicat.huma-num.fr/check.php):
        [simple visualization]

### Guidelines, specifications and help

- TEI
    - [TEI Official website](https://tei-c.org/)
    - [TEI P5 Guidelines](https://tei-c.org/Guidelines/P5/) (go to
        [Read
        online](https://www.tei-c.org/release/doc/tei-p5-doc/en/html/index.html))
    - [TEI-L mailing list](https://tei-c.org/support/#tei-l)
- [IIIF official website](https://iiif.io/)

### JSON and IIIF resources

- Online JSON editors
    - [CuriousConcept](https://jsonformatter.curiousconcept.com/)
    - [JSON-editor](https://jsonformatter.org/json-editor)
- [Hacking Mirador](http://darthcrimson.org/hacking-mirador/)
    - [Darth Crimson Mirador
        viewer](http://www.darthcrimson.org/mirador/)
    - [Oxford Bodleian Libraries IIIF manifest
        editor](www.darthcrimson.org:3000): click on *Open manifest* and
        paste
        `http://213.21.172.53/manifests/public/0b002711800e7d6d.json`
    - [Annotation
        extractor](http://www.darthcrimson.org/hacking-mirador-workshop/annotate.html):
        click on *Load manifest* and paste
        `http://213.21.172.53/manifests/public/0b002711800e7d6d.json`

# Suggested readings

### DH and TEI XML 

- Mancinelli, T. &nbsp;Pierazzo, E. (2020), *Che cos'è un'edizione scientifica digitale*, Carocci, Roma.
- Orlandi, T. (2010), *Informatica testuale. Teoria e prassi*, Laterza, Roma.
- Pierazzo, E. (2015), *Digital Scholarly Editing: Theories, Models and Methods*,
    Ashgate, Farnham (Surrey, UK) and Burlington (VT, USA),
    https://hal.archives-ouvertes.fr/hal-01182162/document
- Stella, F. (2018), *Testi letterari e analisi digitale*, Carocci.

### IIIF 

- F. Cusimano, *Due esempi di "buone pratiche" nell'uso dei metadati
    XML. Un'efficace "disseminazione" dei contenuti digitalizzati*,
    C.R.E.L.E.B.- Università Cattolica, Milano, Edizioni CUSL, Milano
    2014 (Minima Bibliographica, 19), ISBN: 978-88-8132-7058
    https://centridiricerca.unicatt.it/creleb-Cusimano.pdf
- L. Magnuson, *Store and display high resolution images with the
    International Image Interoperability Framework (IIIF)*,
    in «ACRL TechConnect Blog», February 25, 2016,
    https://acrl.ala.org/techconnect/post/store-and-display-high-resolution-images-with-the-international-image-interoperability-framework-iiif/
- A. Salarelli, *International Image Interoperability Framework
    (IIIF): una panoramica*, in «JLIS.it», 8, 1
    (January 2017), pp. 50-66, DOI:
    http://dx.doi.org/10.4403/jlis.it-12090
