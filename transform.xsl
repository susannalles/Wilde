<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="tei">
    <xsl:output method="html" doctype-system="" doctype-public="" indent="yes" encoding="UTF-8"/>

    <xsl:key name="glossary" match="tei:item" use="tei:term/@xml:id"/>
    <xsl:key name="notes" match="tei:note" use="@xml:id"/>
    <xsl:key name="apparatus" match="tei:app" use="@xml:id"/>


    <xsl:template match="/">
        <!-- In the final result you should add the Document Type, 
            this is not the best practise, but I am not able to find a solution now: 
            <!DOCTYPE html>-->
        <html lang="es">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="description" content=""/>
                <meta name="author" content=""/>
                <title>DSE TEMPLATE</title>
                <link rel="preconnect" href="https://fonts.googleapis.com"/>
                <link rel="preconnect" href="https://fonts.gstatic.com"/>
                <link
                    href="https://fonts.googleapis.com/css2?family=Foldit:wght@100..900&amp;family=Playfair+Display:ital,wght@0,400..900;1,400..900&amp;display=swap"
                    rel="stylesheet"/>
                <link rel="stylesheet" href="assets/styles.css"/>
            </head>
            <body>
                <!-- Here you can change the left menu as you wish pointing to the right identifier: -->
                <div class="navmenu navmenu-default navmenu-fixed-left offcanvas">
                    <h5>Wilde Exercise</h5>
                    <ul class="nav navmenu-nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="#selfish-giant">The Selfish Giant</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#other_tales">Other tales</a>
                        </li>
                        <!-- Add all links that you want. This could also be generated automatically. -->
                        <!--<li class="nav-item">
                            <a class="nav-link" href="#chap_3">Chapter 3</a>
                        </li>-->

                        <li class="nav-item">
                            <a class="nav-link" href="#characterList">Characters</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="#notes">Notes</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="#glossary">Glossary</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#bibliography">Bibliography</a>
                        </li>
                    </ul>
                </div>
                <header class="navbar navbar-light bg-light fixed-top">
                    <button class="navbar-toggler" type="button" data-toggle="offcanvas"
                        data-target=".navmenu" data-canvas="body">
                        <span class="navbar-toggler-icon"/>
                    </button>
                </header>
                
                <div class="container">
                    <div class="dse">DSE TEMPLATE</div>
                    <div class="row g-5">
                        <div class="col-md-8" id="contenidotexto">
                            
                            <!--HTML: <section id="chap_1"> -->
                            <!-- Apply templates to main chapters in <body> -->
                            <xsl:apply-templates select="//tei:text/tei:body/tei:div"/>
                            <!-- Apply templates to back matter (notes, glossary, etc.) -->
                            <xsl:apply-templates select="//tei:text/tei:back/tei:div"/>
                        </div>
                        <div class="col-md-4">
                            <div class="position-sticky" style="top: 2rem;">
                                <div class="p-4 mb-3 bg-body-tertiary rounded">
                                    <h4 class="fst-italic">About</h4>
                                    <p class="mb-0">Lorem Ipsum is simply dummy text of the printing
                                        and typesetting industry. Lorem Ipsum has been the
                                        industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to
                                        make a type specimen book.</p>
                                </div>
                                <div class="p-4 asidetextosright">
                                    <h4 class="fst-italic">Elements</h4>
                                    <ul>
                                        <li><label class="check-changetext"><input type="checkbox"
                                                  id="legendpeople"/><span/></label> People</li>
                                        <li><label class="check-changetext"><input type="checkbox"
                                                  id="legendplaces"/><span/></label> Places</li>
                                    </ul>
                                </div>
                                <div class="p-4">
                                    <h4 class="fst-italic">Notes</h4>
                                    <button class="toggle-btn" id="toggleNotes">Hide Notes</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container -->
                <footer>
                    <p>2025 DSE Template <a href="https://github.com/susannalles" target="_blank"
                            >GitHub Repository</a></p>
                </footer>
                <script src="assets/scripts.js"/>
            </body>
        </html>
    </xsl:template>

    <!-- Capítulos y secciones -->
    <xsl:template match="tei:div[@type = 'chapter']">
        <section id="{@xml:id}">
            <h2>
                <xsl:value-of select="tei:head[@type = 'level2']"/>
            </h2>
            <xsl:apply-templates select="tei:p"/>

            <!-- <xsl:for-each select="tei:div[@type = 'sec']">
                <div class="section" id="{@xml:id}">
                    <h3>
                        <xsl:value-of select="tei:head[@type = 'level3']"/>
                    </h3>
                    <xsl:apply-templates select="tei:p"/>
                </div>
            </xsl:for-each>-->
        </section>
    </xsl:template>


<!-- Section for a character list:  -->
    <xsl:template match="tei:div[@xml:id = 'characterList']">
        <section id="{@xml:id}">
            <h2>Characters List</h2>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="tei:listPerson/tei:person">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    
    <!-- Section Notes: -->
    <xsl:template match="tei:div[@xml:id = 'notes']">
        <section id="{@xml:id}">
            <h2>Notes</h2>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="tei:note">
        <p id="{@xml:id}">
            <a href="{@target}">
                <b><xsl:value-of select="@n"/>.</b>
            </a>
            <xsl:text> </xsl:text>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Notes with dynamic tooltip -->

    <xsl:template match="tei:ref[@target]">
        <xsl:variable name="noteId" select="substring-after(@target, '#')"/>
        <xsl:variable name="note" select="key('notes', $noteId)"/>

        <a href="#{$noteId}" class="tooltip2 note" id="{@xml:id}">
            <xsl:value-of select="."/>
            <span class="tooltiptext">
                <xsl:value-of select="$note"/>
            </span>
        </a>
    </xsl:template>

    

    <!-- Section for Critical apparatus -->
    <xsl:template match="tei:div[@xml:id = 'apparatus']">
        <section id="apparatus">
            <h2>
                <xsl:value-of select="tei:head"/>
            </h2>
            <xsl:apply-templates select="tei:listApp/tei:app"/>
        </section>
    </xsl:template>

    <xsl:template match="tei:app">
        <p id="{@xml:id}">
            <a href="#a_{@xml:id}">
                <b>
                    <xsl:value-of select="tei:lem"/>
                    <xsl:text/>
                    <xsl:value-of select="tei:lem/@wit"/>
                </b>: </a>
            <xsl:for-each select="tei:rdg">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@wit"/>: <xsl:value-of select="."/>
                <xsl:if test="position() != last()"> / </xsl:if>
            </xsl:for-each>
        </p>
    </xsl:template>

    <!-- Anchor with tooltip for critical apparatus -->

    <xsl:template match="tei:seg[@type = 'app']">
        <xsl:variable name="appId" select="substring-after(@corresp, '#')"/>
        <xsl:variable name="app" select="key('apparatus', $appId)"/>

        <a href="#{$appId}" class="tooltip2 crit-app" id="{@xml:id}">
            <xsl:apply-templates/>
            <!-- word like 'charts' -->
            <span class="tooltiptext">
                <!--<strong><xsl:value-of select="$app/tei:lem/@wit"/>:</strong>
                <xsl:text> </xsl:text>-->
                <xsl:value-of select="$app/tei:lem"/>
                <xsl:for-each select="$app/tei:rdg">
                    <xsl:text> </xsl:text>
                    <strong><xsl:value-of select="@wit"/>:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="."/>
                </xsl:for-each>
            </span>
        </a>
    </xsl:template>



    <!-- Glossary section: -->
    <xsl:template match="tei:div[@type = 'glossary']">
        <section id="glossary">
            <h2>Glossary</h2>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="tei:item">
        <p id="{tei:term/@xml:id}">
            <b><xsl:value-of select="tei:term"/></b>: <xsl:value-of select="tei:gloss"/>
        </p>
    </xsl:template>

    <!-- This is to encode the glossary terms in the body text extracting dynamicly 
        the tooltip from the definition on the div glossary:-->
    <xsl:template match="tei:term[@corresp]">
        <xsl:variable name="id" select="substring-after(@corresp, '#')"/>
        <xsl:variable name="gloss" select="key('glossary', $id)/tei:gloss"/>

        <a href="#{$id}">
            <span class="tooltip2 gloss">
                <xsl:apply-templates/>
                <span class="tooltiptext">
                    <xsl:value-of select="$gloss"/>
                </span>
            </span>
        </a>
    </xsl:template>



    <!-- Bibliography section -->
    <xsl:template match="tei:div[@type = 'bibliography']">
        <section id="bibliography">
            <h2>Bibliografía</h2>
            <xsl:apply-templates/>
        </section>
    </xsl:template>

    <xsl:template match="tei:listBibl/tei:bibl">
        <p id="{@xml:id}">
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <!-- Template to create links for ref elements in bibliography:  -->
    <xsl:template match="tei:div[@type = 'bibliography']//tei:ref">
        <a href="{@target}" target="_blank">
            <xsl:text>Enlace</xsl:text>
            <xsl:apply-templates/>
        </a>
    </xsl:template>



    <!-- Paragraphs -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xsl:template match="tei:title">
        <i>
            <xsl:apply-templates/>
        </i>
    </xsl:template>

    <!-- Line breaks -->
    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

    <!-- This template is to process the element <persName> -->
    <xsl:template match="tei:persName">
        <span class="persName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <!-- This template is to process the element <placeName> -->
    <xsl:template match="tei:placeName">
        <span class="placeName">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


</xsl:stylesheet>
