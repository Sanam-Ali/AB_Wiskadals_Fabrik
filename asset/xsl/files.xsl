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
                    on your browsers tab--> A.B Wiskadals Fabrik Catalog: Files </title>
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
                    <h1> Project files </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> | <a href="toplayer.html">Top Layer</a> | <a
                        href="design.html">Design At A Glance</a> | <a href="files.html">Files</a>
                </nav>
                <main id="downloadable files">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                        <!--Defines a row which is centre-justified to make it look nicer-->
                        <p>On this page, you can open and download the project's files including the
                            XML file, JPG images, and a PDF of the project's images and text.</p>
                        <div class="row justify-content-center">
                            <div class="col-2">
                                <h2>Project PDF</h2>
                                <p>Click on the link to open the pdf file, then save it using
                                    your browser's 'save as' or 'print' functions.</p>
                                <article id="PDF">
                                    <a>
                                        <xsl:attribute name="href">asset/pdf/Wiskadals
                                            AB.pdf</xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>PDF
                                        file</a>

                                </article>
                            </div>
                            <div class="col-2">
                                <h2>XML file</h2>
                                <p>Click on the link to open the project's TEI compliant XML file, then copy or
                                    download it.</p>
                                <article id="TEI">
                                    <a>
                                        <xsl:attribute name="href">tei/tei.txt</xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>XML
                                        file</a>
                                </article>
                            </div>
                            <div class="col-2">
                                <h2>Full image</h2>
                                <p>Click on the link, then save it using your browser's
                                    'save as' or 'print' functions.</p>
                                <article id="Image_40_41">
                                    
                                    <a>
                                        <xsl:attribute name="href"
                                            >asset/img/pg_40_41.jpg</xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>JPG Image of
                                        pages 40 and 41</a>
                                    
                                </article>
                            </div>
                            
                            <div class="col-2">
                                <h2>Page 40 image</h2>
                                <p>Click on the link, then save it using your browser's
                                    'save as' or 'print' functions.</p>
                                <article id="Image_40">                               
                                    
                                    <a>
                                        <xsl:attribute name="href">asset/img/pg_40.jpg</xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>JPG image page 40
                                    </a>
                                </article>
                            </div>
                            <div class="col-2">
                                <h2>Page 41 image</h2>
                                <p>Click on the link, then save it using your browser's
                                    'save as' or 'print' functions.</p>
                                <article id="Image_41">                                                                    
                                    <a>
                                        <xsl:attribute name="href">asset/img/pg_41.jpg</xsl:attribute>
                                        <xsl:attribute name="target">_blank</xsl:attribute>JPG image page 41
                                    </a>
                                </article>
                            </div>
                        </div>
 
                          
                    </div>
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
