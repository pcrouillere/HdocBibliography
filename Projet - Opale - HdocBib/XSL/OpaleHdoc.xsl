<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0"
    xmlns:bib="http://www.utc.fr/ics/hdoc/bibtexXm"
    xmlns:sc="http://www.utc.fr/ics/scenari/v3/core"
    xmlns:op="utc.fr:ics/opale3"
    xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive"
    xmlns:hdoc="http://www.utc.fr/ics/hdoc/bibtexXm">
    <xsl:output indent="yes" method="xml"></xsl:output>
    <xsl:template match="file">
        <hdoc:file>
            <xsl:for-each select="entry">
                
                    <xsl:apply-templates></xsl:apply-templates>
                
            </xsl:for-each>
        </hdoc:file>
    </xsl:template>
    
    
    <xsl:template match="sc:item">
        <hdoc:entry> <xsl:attribute name="id"><xsl:value-of select="op:bib/op:bibM/sp:id"></xsl:value-of></xsl:attribute>
            <hdoc:misc>
            
            <xsl:apply-templates select="op:bib/op:bibM"></xsl:apply-templates>
            </hdoc:misc>
        </hdoc:entry>
    </xsl:template>
    
    
    <xsl:template match="op:bibM" xmlns:op="utc.fr:ics/opale3">
                <xsl:apply-templates select="sp:desc/op:bibTxt/sc:para"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="sc:para">
        <hdoc:note><xsl:attribute name="type_of">note</xsl:attribute><xsl:value-of select="child::node()[not(@*)]"></xsl:value-of></hdoc:note>
        <xsl:apply-templates select="./sc:textLeaf"></xsl:apply-templates>
        <xsl:apply-templates select="./sc:uLink"></xsl:apply-templates>
    </xsl:template>
    
    <xsl:template match="sc:textLeaf[@role='auth']">
        <hdoc:author><xsl:value-of select="."></xsl:value-of></hdoc:author>
    </xsl:template>
    
    <!-- Probleme : impossible de savoir si on est en rpésence d'un booktitle, d'un title etc -->
    <xsl:template match="sc:textLeaf[@role='title']">
        <hdoc:title><xsl:value-of select="."></xsl:value-of></hdoc:title>
    </xsl:template>
    
    <xsl:template match="sc:textLeaf[@role='date']">
        <xsl:analyze-string select="." regex="\d{{4}}">
        <!-- Essayer de récupérer au moins l'année -->
            <xsl:matching-substring>
                <hdoc:year><xsl:value-of select="."/></hdoc:year>
            </xsl:matching-substring>
            <xsl:non-matching-substring>
                <hdoc:note type_of="date"><xsl:value-of select="."/></hdoc:note> 
            </xsl:non-matching-substring>
        </xsl:analyze-string>
    </xsl:template>
    
    <xsl:template match="sc:textLeaf[@role='ed']">
        <hdoc:editor><xsl:value-of select="."></xsl:value-of></hdoc:editor>
    </xsl:template>
    
    <xsl:template match="sc:uLink">
        <hdoc:url><xsl:value-of select="./@url"></xsl:value-of></hdoc:url>
    </xsl:template>
</xsl:stylesheet>