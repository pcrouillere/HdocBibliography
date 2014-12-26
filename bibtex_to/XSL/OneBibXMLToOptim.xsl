<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:bib="http://www.utc.fr/ics/hdoc/bibtexXm"
    xmlns:op="utc.fr:ics/opale3">
    
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:param name="Position"/>
    <xsl:template match="bib:file">
        <xsl:for-each select="bib:entry">
            <xsl:if test="position()=$Position">
                <sc:item xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
                        <of:def xmlns:of="scpf.org:office" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive">
                            <of:defM>
                                <sp:term><xsl:value-of select="@id"></xsl:value-of></sp:term>
                            </of:defM>
                            <sp:def>
                                <of:sTxt>
                                    <sc:para xml:space="preserve">
                                        
                                 <xsl:apply-templates select="child::node()/bib:author"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:year"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:title"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:booktitle"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:editor"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:publisher"></xsl:apply-templates>
                                  <xsl:apply-templates select="child::node()/bib:address"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:edition"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:url"></xsl:apply-templates> 
                                 <xsl:apply-templates select="child::node()/bib:journal"></xsl:apply-templates> 
                                  <xsl:apply-templates select="child::node()/bib:series"></xsl:apply-templates> 
                                 <xsl:apply-templates select="child::node()/bib:volume"></xsl:apply-templates>  
                                 <xsl:apply-templates select="child::node()/bib:number"></xsl:apply-templates>  
                                 <xsl:apply-templates select="child::node()/bib:chapter"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:pages"></xsl:apply-templates> 
                                  <xsl:apply-templates select="child::node()/bib:type"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:institution"></xsl:apply-templates>
                                 <xsl:apply-templates select="child::node()/bib:organization"></xsl:apply-templates>                               
                                 <xsl:apply-templates select="child::node()/bib:howpulished"></xsl:apply-templates> 
                                 <xsl:apply-templates select="child::node()/bib:note"></xsl:apply-templates>     
                                        
                                        
                                  </sc:para>
                                </of:sTxt>
                            </sp:def>
                        </of:def>
                    </sc:item>                            
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="bib:url">
        <sc:uLink role="url" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
            <xsl:attribute name="url"><xsl:value-of select="."/></xsl:attribute>
            <xsl:value-of select="."/>
        </sc:uLink>
    </xsl:template>
    
    
    <xsl:template match="bib:editor | bib:publisher">
        <xsl:value-of select="."/>
     
    </xsl:template>

    
    <xsl:template match="bib:author">                
            <xsl:value-of select="."/> 
    </xsl:template>
    
    <xsl:template match="bib:year">
        <xsl:value-of select="../bib:month"/> <xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="bib:title | bib:booktitle">
            <xsl:value-of select="."/>
        
    </xsl:template>
    
    
    
    <xsl:template match="bib:volume | bib:number">
        Volume : <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:chapter">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:series">
        Series : <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:edition">
        Edition : <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:address">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:journal">
        Journal : <xsl:value-of select="."/>
    </xsl:template> 
    
    <xsl:template match="bib:pages">
        Pages : <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:type">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:institution">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:organization">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:howpublished">
        <xsl:value-of select="."/>
    </xsl:template>
    
    <xsl:template match="bib:note">
        Note : <xsl:value-of select="."/>
    </xsl:template>
    
</xsl:stylesheet>