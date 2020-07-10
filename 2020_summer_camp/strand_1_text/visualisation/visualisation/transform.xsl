<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#" xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dbo="http://dbpedia.org/ontology/" exclude-result-prefixes="xs" version="1.0">
    <xsl:output method="html"/>
    <xsl:strip-space elements="app-realia-list"/>
    
    <!-- realia: insert the realia list app web element
         with the specified type and items list.
         - $type: the type string (person or place)
         - $items: a list of rdf:Description nodes with the source
         data for the app. This assumes that each node has
         @rdf:about="URI" and rdfs:label.
    -->
    <xsl:template name="realia">
        <xsl:param name="items"/>
        <xsl:param name="type"/>
        <app-realia-list>
            <xsl:attribute name="type">
                <xsl:value-of select="$type"/>
            </xsl:attribute>
            <xsl:attribute name="json-list">
                <xsl:text>[</xsl:text>
                <xsl:for-each select="$items">
                    <xsl:if test="position() &gt; 1">
                        <xsl:text>,</xsl:text>
                    </xsl:if>
                    <xsl:text>{&quot;uri&quot;:&quot;</xsl:text>
                    <xsl:value-of select="./@rdf:about"/>
                    <xsl:text>&quot;, &quot;label&quot;:&quot;</xsl:text>
                    <xsl:value-of select="./rdfs:label"/>
                    <xsl:text>&quot;}</xsl:text>
                </xsl:for-each>
                <xsl:text>]</xsl:text>
            </xsl:attribute>
        </app-realia-list>
    </xsl:template>
    
    <!-- realia-title: insert a title attribute with value equal to the
         person or place label from the realia list.
         - $id: the TEI ID of the person or place. -->
    <xsl:template name="realia-title">
        <xsl:param name="id"/>
        <xsl:variable name="p"
            select="/tei:TEI/tei:teiHeader/tei:xenoData/rdf:RDF/rdf:Description[@tei:ref = $id]"/>
        <xsl:if test="$p/rdfs:label">
            <xsl:attribute name="title">
                <xsl:value-of select="$p/rdfs:label"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>
    
    <!-- persons list -->
    <xsl:template name="person-list">
        <ul>
            <xsl:for-each
                select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person/tei:persName">
                <xsl:sort order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <!-- places list -->
    <xsl:template name="place-list">
        <ul>
            <xsl:for-each
                select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:listPlace/tei:place/tei:placeName">
                <xsl:sort order="ascending"/>
                <li>
                    <xsl:value-of select="."/>
                </li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <!-- teiHeader -->
    <xsl:template match="tei:teiHeader"> </xsl:template>
    
    <!-- figure -->
    <xsl:template match="tei:figure">
        <xsl:variable name="caption" select="tei:figDesc"/>
        <figure>
            <xsl:element name="img">
                <xsl:attribute name="src">
                    <xsl:value-of select="tei:graphic/@url"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="$caption"/>
                </xsl:attribute>
                <xsl:attribute name="title">
                    <xsl:value-of select="$caption"/>
                </xsl:attribute>
            </xsl:element>
            <figcaption><xsl:value-of select="$caption"/></figcaption>
        </figure>
    </xsl:template>
    
    <!-- pb -->
    <xsl:template match="tei:pb">
        <div class="pn">
            <xsl:choose>
                <xsl:when test="@facs">
                    <a href="{@facs}" target="_blank" title="View {@n}">
                        <xsl:value-of select="@n"/>
                    </a>
                </xsl:when>
                <xsl:otherwise> [<xsl:value-of select="@n"/>] </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
    
    <!-- cb -->
    <xsl:template match="tei:cb">
        <div class="cn"> [col.<xsl:value-of select="@n"/>] </div>
    </xsl:template>
    
    <!-- lb -->
    <xsl:template match="tei:lb">
        <xsl:if test="not(@break) or (@break != 'yes')">
            <br/>
        </xsl:if>
        <span class="ln"> [<xsl:value-of select="@n"/>] </span>
    </xsl:template>
    
    <!-- num -->
    <xsl:template match="tei:num">
        <span class="nr">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- persName -->
    <xsl:template match="tei:persName">
        <xsl:variable name="targetId" select="substring(@ref,2)"/>
        <xsl:variable name="name" select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:particDesc/tei:listPerson/tei:person[@xml:id=$targetId]/tei:persName"/>
        <span class="pers-name" title="{$name}">
            <!--
            <xsl:call-template name="realia-title">
                <xsl:with-param name="id" select="@ref"/>
            </xsl:call-template>
            -->
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- placeName -->
    <xsl:template match="tei:placeName">
        <xsl:variable name="targetId" select="substring(@ref,2)"/>
        <xsl:variable name="name" select="/tei:TEI/tei:teiHeader/tei:profileDesc/tei:settingDesc/tei:listPlace/tei:place[@xml:id=$targetId]/tei:placeName"/>
        <span class="place-name" title="{$name}">
            <!--
            <xsl:call-template name="realia-title">
                <xsl:with-param name="id" select="@ref"/>
            </xsl:call-template>
            -->
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- name -->
    <xsl:template match="tei:name">
        <span class="name">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- date -->
    <xsl:template match="tei:date">
        <span class="date">
            <xsl:attribute name="title">
                <xsl:value-of select="@when"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <!-- ex -->
    <xsl:template match="tei:ex">
        <span class="ex">
            <xsl:value-of select="."/>
        </span>
    </xsl:template>
    
    <!-- hi -->
    <xsl:template match="tei:hi">
        <xsl:choose>
            <xsl:when test="@rend = 'initial'">
                <span class="drop-cap">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            <xsl:when test="@rend = 'superscript'">
                <span class="super">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
            <xsl:when test="@rend = 'blue'">
                <span class="blue-ink">
                    <xsl:value-of select="."/>
                </span>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <!-- head -->
    <xsl:template match="tei:head">
        <div>
            <xsl:attribute name="class">
                <xsl:if test="@rend = 'rubricated'">red-ink</xsl:if>
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!-- p -->
    <xsl:template match="tei:p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <!-- div -->
    <xsl:template match="tei:div">
        <h3>
            <xsl:value-of select="@type"/>
            <xsl:if test="@n">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@n"/>
            </xsl:if>
        </h3>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- body -->
    <xsl:template match="tei:body">
        <article>
            <xsl:apply-templates/>
        </article>
    </xsl:template>
    
    <!-- facsimile -->
    <xsl:template match="tei:facsimile"/>
    
    <!-- catch-all -->
    <xsl:template match="*">
        <xsl:message terminate="no">WARNING: Unmatched element: <xsl:value-of select="name()"/>
        </xsl:message>
        <xsl:apply-templates/>
    </xsl:template>
    
    <!-- root template -->
    <xsl:template match="/tei:TEI">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:variable name="title"
            select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
        <html>
            <head>
                <meta charset="utf-8"/>
                <meta name="description" content="TEI Sample"/>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
                    rel="stylesheet"/>
                <link rel="stylesheet" href="indigo-pink.css"/>
                <link rel="stylesheet" href="styles.css"/>
                <script src="https://maps.googleapis.com/maps/api/js"/>
                <script src="realia-list.js"/>
                <title>
                    <xsl:value-of select="$title"/>
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="$title"/>
                </h1>
                <xsl:apply-templates/>
                
                <hr/>
                <h2>Persons</h2>
                <xsl:call-template name="realia">
                    <xsl:with-param name="type" select="'person'"/>
                    <xsl:with-param name="items"
                        select="tei:teiHeader/tei:xenoData/rdf:RDF/rdf:Description[rdf:type/@rdf:resource='http://xmlns.com/foaf/0.1/Person']"/>
                </xsl:call-template>
                <h2>Places</h2>
                <xsl:call-template name="realia">
                    <xsl:with-param name="type" select="'place'"/>
                    <xsl:with-param name="items"
                        select="tei:teiHeader/tei:xenoData/rdf:RDF/rdf:Description[rdf:type/@rdf:resource='http://dbpedia.org/ontology/Place']"/>
                </xsl:call-template>
                
                <hr/>
                <h2>Persons Index</h2>
                <xsl:call-template name="person-list"></xsl:call-template>
                <h2>Places Index</h2>
                <xsl:call-template name="place-list"></xsl:call-template>                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
