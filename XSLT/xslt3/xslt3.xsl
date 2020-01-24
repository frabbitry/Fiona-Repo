<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    xmlns="http://www.w3.org/1999/xhtml"
    version="3.0">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    <!--frc: Main template rule to set up the structure of the html document and the tables. -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Sanitary Conditions of Workshops and Factories in New York City</title>
            </head>
            <body>
                <h1>Sanitary Conditions of Workshops and Factories in New York City</h1>
                <h2>Table 1: Yes or No Questions</h2>
                <table>
                    <tr>
                        <th>Number</th>
                        <th>Question</th>
                        <th>Yes</th>
                        <th>Yes but fined</th>
                        <th>No</th>
                        <th>Blank</th>
                        <th>Total</th>
                    </tr>
                    <tr>
                    <xsl:apply-templates select="/TEI/text/body/div/fs[f[@select='Yes']]"/>
                    </tr>
                </table>
                <h2>Table 2: Sources of Offensive Odors</h2>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Water Closet</th>
                        <th>Other Sources</th>
                        <th>Total Responses</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select="TEI/text/body/div/fs[f[@select='water_closet']]"/>
                    </tr>
                </table>
                <h2>Table 3: Standing or Sitting at Work</h2>
                <table>
                    <tr>
                        <th>Question</th>
                        <th>Sit</th>
                        <th>Stand</th>
                        <th>Optional</th>
                        <th>Blank</th>
                        <th>Total Responses</th>
                    </tr>
                    <tr>
                        <xsl:apply-templates select="TEI/text/body/div/fs[f[@select='Sit']]"/>
                    </tr>
                </table>
            </body>
        </html>
    
    </xsl:template>
    <!--frc: Template match to grab the table data for the Yes/No table. -->
    <xsl:template match="fs[f[@select='Yes']]">
    
            <td><xsl:value-of select="count(preceding::fs[f[@select='Yes']])+1"/></td>
            <td><xsl:apply-templates select="descendant::f[@name='question']/string"/></td>
            <td><xsl:apply-templates select="descendant::f[@select = 'Yes']/@n"/></td>
            <td><xsl:apply-templates select="descendant::f[@select = 'Yes_but_fined']/@n"/></td>
            <td><xsl:apply-templates select="descendant::f[@select= 'No']/@n"/></td>
            <td><xsl:apply-templates select="descendant::f[@select='Blank']/@n"/></td>
        <td><xsl:value-of select="sum(descendant::f[@name='response']/@n)"/></td>
       
    </xsl:template>
    

    <!--frc: Template match to grab the table data for the second table. -->
    <xsl:template match="fs[f[@select='water_closet']]">
        <td><xsl:apply-templates select="descendant::f[@name='question']/string"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='water_closet']/@n"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='other_causes']/@n"/></td>
        <td><xsl:value-of select="sum(descendant::f[@name='response']/@n)"/></td>
    </xsl:template>
    
    
    <!--frc: Template match to grab the table data for the third table.  -->
    <xsl:template match="fs[f[@select='Sit']]">
        <td><xsl:apply-templates select="descendant::f[@name='question']/string"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='Sit']/@n"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='Stand']/@n"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='Optional']/@n"/></td>
        <td><xsl:apply-templates select="descendant::f[@select='Blank']/@n"/></td>
        <td><xsl:apply-templates select="sum(descendant::f[@name='response']/@n)"/></td>
    </xsl:template>

    
    
    
</xsl:stylesheet>