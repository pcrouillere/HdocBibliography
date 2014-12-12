<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:param name="Resource"/>
    
    <xsl:template match="file">
           <file>
                <xsl:for-each 
                    select="collection(
                    '../source/?select=*.ref;recurse=yes;on-error=warning'
                    )" >
                <entry>
                <xsl:copy-of select="."></xsl:copy-of>
                </entry>
           </xsl:for-each> 
        </file>
    </xsl:template>
</xsl:stylesheet>