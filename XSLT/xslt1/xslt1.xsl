<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    
    <xsl:mode on-no-match="shallow-copy"/>
    
    <!--frc: Matches on all emph elements, takes their contents, and puts them in hi elements. -->
    <xsl:template match="emph">
        <hi rend="italics"><xsl:apply-templates/></hi>
    </xsl:template>
    
    <!--frc: Matches on all l elements that are children of head elements and replaces them with a self-closing lb element. -->
    <xsl:template match="head/l">
        <xsl:apply-templates/> <lb/>
    </xsl:template>
    
    <!--frc: Matches on the divs with type attribute value "book" and numbers them. -->
    <xsl:template match="div[@type='book']">
        <div type = "book" n="{count(preceding-sibling::div[@type='book'])+1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <!--frc: Does the same as the one above except for chapters. -->
    <xsl:template match="div[@type='chapter']">
        <div type="chapter" n="{count(preceding-sibling::div[@type='chapter'])+1}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    
</xsl:stylesheet>