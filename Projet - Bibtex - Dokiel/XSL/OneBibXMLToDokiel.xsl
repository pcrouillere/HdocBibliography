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
                 <dk:bib xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive" xmlns:dk="kelis.fr:dokiel">
                     <dk:bibM>
                         <sp:id><xsl:value-of select="@id"></xsl:value-of></sp:id>
                         <sp:desc>
                             <dk:docTxt>
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
                             </dk:docTxt>
                         </sp:desc>
                     
                     
                     </dk:bibM>
                     
                 </dk:bib>
                 <xsl:apply-templates select="child::node()/bib:url"></xsl:apply-templates>
             </sc:item>
        </xsl:if>
     </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="bib:url" xmlns:sp="http://www.utc.fr/ics/scenari/v3/primitive"  xmlns:dk="kelis.fr:dokiel">
        <sp:source>
            <dk:url>
                <dk:urlM>
                    <sp:url><xsl:value-of select="."/></sp:url>
                </dk:urlM>
            </dk:url>
        </sp:source>
    </xsl:template>
    

    <xsl:template match="bib:editor | bib:publisher">
        <sc:textLeaf role="ed" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core"><xsl:value-of select="."/>
           <xsl:text> </xsl:text></sc:textLeaf>
    </xsl:template>
    <xsl:template match="bib:editor[last()] | bib:publisher[last()]">
        <sc:textLeaf role="ed" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
            <xsl:value-of select="."/>
        </sc:textLeaf>
    </xsl:template>
       
    <xsl:template match="bib:author">                
        <sc:textLeaf role="auth" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
            <xsl:value-of select="."/> <xsl:text> </xsl:text>
        </sc:textLeaf>
    </xsl:template>
    <xsl:template match="bib:author[last()]">                
        <sc:textLeaf role="auth" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
            <xsl:value-of select="."/>
        </sc:textLeaf>
    </xsl:template>
    
    <xsl:template match="bib:year">
        <sc:textLeaf role="date" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core"><xsl:value-of select="../bib:month"/> <xsl:text> </xsl:text><xsl:value-of select="."/></sc:textLeaf>
    </xsl:template>
    
    <xsl:template match="bib:title | bib:booktitle">
        <sc:textLeaf role="title" xmlns:sc="http://www.utc.fr/ics/scenari/v3/core">
            <xsl:value-of select="."/>
        </sc:textLeaf>
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



