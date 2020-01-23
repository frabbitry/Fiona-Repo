<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <!--frc: Sets up the "outer layer" of the HTML document. -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Digital Mitford Site Index</title>
            </head>
            <body>
                <ol>
                <xsl:apply-templates select="//TEI/text/body/div/listOrg"/>
                    
                </ol>
            </body>
        </html>
        
    </xsl:template>
    
    <!--frc: Moves a layer in and matches on each listOrg element from the first 
    layer, then narrows it down to the head and org elements while setting up the 
    second layer of the shell. -->
    <xsl:template match="listOrg">
        <li>
            <xsl:apply-templates select="head"/>
            <ul>
                <xsl:apply-templates select="descendant::org"/>
            </ul>
        </li>
        
    </xsl:template>
    
    <!--Finally, we get to the core of the onion and can grab the orgName from each
    of the org elements.-->
    <xsl:template match="org">
        <li>
            <xsl:apply-templates select="orgName"/>
        </li>
    </xsl:template>
    
</xsl:stylesheet>