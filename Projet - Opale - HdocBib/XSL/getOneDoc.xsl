<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:param name="Resource"/>
    
    <xsl:template match="file">
        <xsl:param name="Uri">
            <xsl:value-of select="replace($Resource, '\\', '/')"></xsl:value-of>
        </xsl:param>
        <xsl:param name="Uri2">
            <xsl:value-of select="concat('file:///',$Uri )"></xsl:value-of>
        </xsl:param>
        <xsl:param name="UriFinal">
            <xsl:value-of select="concat($Uri2,'/?select=*.ref' )"></xsl:value-of>
        </xsl:param>
        
        
           <file>
                <xsl:for-each 
                    select="collection(
                        $UriFinal
                    )" >
                <entry>
                <xsl:copy-of select="."></xsl:copy-of>
                </entry>
           </xsl:for-each> 
        </file>
        
        

    </xsl:template>
</xsl:stylesheet>