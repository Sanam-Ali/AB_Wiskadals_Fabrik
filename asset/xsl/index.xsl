<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:html="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs tei html" version="2.0">
    <xsl:output method="html"/>
    
    <!-- transform the root element (TEI) into an HTML template -->
    <xsl:template match="tei:TEI">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text><xsl:text>&#xa;</xsl:text>
        <html lang="en" xml:lang="en">
            <head>
                <title>
                    <!-- add the title from the metadata. This is what will be shown
                    on your browsers tab-->
                    A.B Wiskadals Fabrik Catalog: Home
                </title>
                <!-- load bootstrap css (requires internet!) so you can use their pre-defined css classes to style your html -->
                <!--Stylesheet local, fix and delete before sending-->
                <link rel="stylesheet"
                    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                    crossorigin="anonymous"/>
                <!-- load the stylesheets in the assets/css folder, where you can modify the styling of your website -->
                <link rel="stylesheet" href="asset/css/main.css"/>
                <link rel="stylesheet" href="asset/css/desktop.css"/>
                
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:apply-templates
                            select="//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                    </h1>
                </header>
                <nav id="sitenav">
                    <a href="index.html">Home</a> |
                    <a href="toplayer.html">Top Layer</a> |
                    <a href="design.html">Design At A Glance</a> |
                    <a href="files.html">Files</a> |
                    <a href="about.html">About</a>
                    
                </nav>
                <main id="manuscript">
                    <!-- bootstrap "container" class makes the columns look pretty -->
                    <div class="container">
                        <!-- define a row layout with bootstrap's css classes (two columns) -->
                        <div class="row">
                            <!-- first column: load the image based on the IIIF link in the graphic above -->
                            <div class="col-sm">
                                <article id="thumbnail">
                                    <img class="cover_image">
                                        <xsl:attribute name="src">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface//tei:graphic[@xml:id = 'cover_full']/@url"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="title">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface[@xml:id = 'cover']//tei:label"
                                            />
                                        </xsl:attribute>
                                        <xsl:attribute name="alt">
                                            <xsl:value-of
                                                select="//tei:facsimile/tei:surface[@xml:id = 'cover']//tei:figDesc"
                                            />
                                        </xsl:attribute>
                                    </img>    
                                </article>
                            </div>
                            <!-- second column: apply matching templates for anything nested underneath the tei:text element -->
                            <div class="col-sm">
                                <article id="description">
                                    <article id="transcription">
                                        <!--This Description is now supplied by the summary at line 102 of the TEI header under msDesc-->
                                        <p>
                                            <strong>Description:</strong>
                                            <xsl:apply-templates select="//tei:TEI//tei:encodingDesc//tei:projectDesc"/>
                                        </p>
                                        <img>
                                            <xsl:attribute name="src">
                                                <xsl:value-of
                                                    select="//tei:facsimile/tei:surface//tei:graphic[@xml:id = 'pg40_41_full']/@url"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="title">
                                                <xsl:value-of
                                                    select="//tei:facsimile/tei:surface[@xml:id = 'pg40_41']//tei:label"
                                                />
                                            </xsl:attribute>
                                            <xsl:attribute name="alt">
                                                <xsl:value-of
                                                    select="//tei:facsimile/tei:surface[@xml:id = 'pg40_41']//tei:figDesc"
                                                />
                                            </xsl:attribute>
                                        </img>    
                                        
                                    </article>
                                </article>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm">
                                <article id="details">
                                    <p>
                                        <strong>Author:</strong>
                                        <br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:author"/>
                                        
                                    </p>
                                    <p>
                                        <strong>Transcription and encoding by:</strong><br/>
                                        <xsl:apply-templates select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:principal[1]"/>
                                        <xsl:text> and </xsl:text>
                                        <xsl:apply-templates select="//tei:TEI//tei:fileDesc//tei:titleStmt//tei:principal[2]"/>
                                    </p>
                                    <p>
                                        <strong>TEI customization and OCR by:</strong><br/>
                                        <xsl:value-of select="//tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:respStmt/tei:persName[@xml:id='SA']"/>
                                    </p>
                                    <p>
                                        <strong>Holding repository:</strong><br/>
                                        <xsl:value-of select="id('repo')"/>
                                    </p>   
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
                                    <img src="asset/img/cc.svg" class="copyright_logo" alt="Creative Commons License"/><img src="asset/img/by.svg" class="copyright_logo" alt="Attribution 4.0 International"/>
                                </a>
                            </div>
                            <div>
                                2023 Rachel Bayston &amp; Sanam Ali.
                            </div>
                        </div>
                    </div>
                </footer>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>
</xsl:stylesheet>