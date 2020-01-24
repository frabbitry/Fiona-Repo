<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml" version="3.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Skyrim</title>
                <link rel="stylesheet" type="text/css" href="style.css"/>
            </head>
            <body>
                <xsl:apply-templates select="/skyrim/body/paragraph"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="QuestEvent">
        <span class="QuestEvent"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="QuestItem">
        <span class="QuestItem"><xsl:apply-templates/></span>
    </xsl:template>

    <xsl:template match="character[@ref='UrielSeptim']">
        <span class="character Agood"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="character[@ref='hero']">
        <span class="character Aneutral"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="character[@ref='Jauffre']">
        <span class="character Agood">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="character[@ref='MartinSeptim']">
        <span class="character Agood">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="character[@ref='MehrunesDagon']">
        <span class="character Aevil">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="character[@ref='MankarCamoran']">
        <span class="character Aevil">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    

    <xsl:template match="epithet">
        <span class="epithet"><xsl:apply-templates/></span>
    </xsl:template>
   
    <xsl:template match="faction[@ref='MythicDawn']">
        <span class="faction Aevil"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="faction[@ref='blades']">
        <span class="faction Agood"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="faction[@ref='daedra']">
        <span class="faction Aevil"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="faction[@ref='empire']">
        <span class="faction Agood"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="faction[@ref='DarkBrotherhood']">
        <span class="faction Aneutral"><xsl:apply-templates/></span>
    </xsl:template>
    
    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>