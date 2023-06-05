<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>

    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab--> A.B Wiskadals Fabrik Catalog: About </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website-->
                <link rel="stylesheet" href="asset/css/main.css"/>
                <link rel="stylesheet" href="asset/css/desktop.css"/>
            </head>

            <body>
                <header>
                    <h1> <xsl:apply-templates select="//tei:titleStmt/tei:title"/></h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> | <a href="toplayer.html">Top Layer</a> | <a
                        href="design.html">Design At A Glance</a> | <a href="files.html">Files</a> |
                        <a href="about.html">About</a>
                </nav>
                <main>
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container" style="max-width:750px;">
                        <h2 class="text-center">About the site</h2>
                        <p>This website gives you access to scans and text from the
                                <xsl:apply-templates
                                select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:author"/>
                            clothing catalog. Top Layer reproduces the text in full, accompanied by
                            the scanned images of the catalog pages. Design at a Glance allows you
                            to view details of garment design and style in tabular form. Files
                            allows you to view and download the project files, including the TEI
                            document as a .txt file, a PDF of the project, and the images of the
                            source document as JPGs. With the exception of this page, the site was
                            built by transforming the TEI file using XSLT stylesheet. </p>
                        <h2 class="text-center">About the project</h2>
                        <p>This is a short project to digitize a single double-page spread from the
                            AB Wiskadals 1951-52 catalog. It exists to demonstrate basic ability in
                            core competencies of digitization, but also to work towards a framework
                            that could be used to digitize large archives of ephemera in Borås
                            Textilmuseet and potentially elsewhere.</p>

                        <h2 class="text-center">About us</h2>
                        <div class="row">
                            <div class="col-md-6">
                                <h3 class="text-center" style="font-size: 1.25vw;"><xsl:apply-templates
                                    select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:respStmt//tei:persName[@xml:id='SA']"/></h3>


                                <p>Sanam holds a Master’s degree in computer science and taught the
                                    subject at undergraduate level for several years before
                                    embarking on the MsC in Library and Information Science at Borås
                                    Högskolan. She can be contacted at: <strong>sanamali.1989@gmail.com</strong></p>
                            </div>
                            <div class="col-md-6">
                                <h3 class="text-center" style="font-size: 1.25vw;"><xsl:apply-templates
                                    select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:respStmt//tei:persName[@xml:id='RB']"/></h3>
                                <p>Rachel works in digital marketing, proofreading and editing. She
                                    can be contacted at: <strong>r.bayston@gmail.com</strong> </p>
                            </div>
                        </div>
                        <h2 class="text-center">Acknowledgements</h2>
                        <p>The team gratefully acknowledges the assistance of our teachers and
                            fellow students at Borås Högskolan, and gives special thanks to <strong>Johannes
                                Daun</strong> (Industrial Heritage Co-ordinator) of Borås Textilmuseet.</p>
                    </div>

                    <!--Defines a row which is centre-justified to make it look nicer-->

                </main>
                <footer>
                    <div class="row" id="footer">
                        <div class="col-sm copyright">
                            <div>
                                <a href="https://creativecommons.org/licenses/by/4.0/legalcode">
                                    <img src="asset/img/cc.svg" class="copyright_logo"
                                        alt="Creative Commons License"/>
                                    <img src="asset/img/by.svg" class="copyright_logo"
                                        alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div> 2023 Rachel Bayston &amp; Sanam Ali. </div>
                        </div>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
