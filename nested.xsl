<?xml version="1.0" encoding="UTF-8"?>
<!--If“UTF” stands for Unicode Standard Transformation Format. 
It refers to a way of encoding characters (letters, symbols, etc.) defined by Unicode into bytes for storage or transmission.
<xsl:stylesheet version="1.0"-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title><xsl:value-of select="book/title"/></title>
                <style>
                    body {
                        font-family: 'Georgia', serif;
                        line-height: 1.6;
                        background: #f4f0e6;
                        margin: 0;
                        padding: 0;
                    }
                    .book-container {
                        width: 60%;
                        margin: auto;
                        background: #fff;
                        padding: 2em;
                        box-shadow: 0 0 15px rgba(0,0,0,0.2);
                        page-break-after: always;
                    }
                    h1, h2 {
                        text-align: center;
                        color: #3b2e2e;
                    }
                    h2 {
                        margin-top: 2em;
                    }
                    p {
                        text-indent: 2em;
                        text-align: justify;
                    }
                    .page-break {
                        page-break-after: always;
                    }
                </style>
            </head>
            <body>
                <div class="book-container">
                    <h1><xsl:value-of select="book/title"/></h1>
                    <h3 style="text-align:center;">By <xsl:value-of select="book/author"/></h3>

                    <xsl:for-each select="book/chapters/chapter">
                        <xsl:variable name="chapterNum" select="@number"/>
                        <!-- Nested if-else -->
                        <xsl:choose>
                            <xsl:when test="$chapterNum &lt; 3">
                                <h2>Chapter <xsl:value-of select="@number"/>: <xsl:value-of select="@title"/></h2>
                                <xsl:for-each select="section">
                                    <xsl:for-each select="para">
                                        <p><xsl:value-of select="."/></p>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:when test="$chapterNum = 3">
                                <h2 style="color: darkblue;">Chapter <xsl:value-of select="@number"/>: <xsl:value-of select="@title"/></h2>
                                <xsl:for-each select="section">
                                    <xsl:for-each select="para">
                                        <p><xsl:value-of select="."/></p>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <h2 style="color: darkred;">Chapter <xsl:value-of select="@number"/>: <xsl:value-of select="@title"/></h2>
                                <xsl:for-each select="section">
                                    <xsl:for-each select="para">
                                        <p><xsl:value-of select="."/></p>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:otherwise>
                        </xsl:choose>
                        <div class="page-break"></div>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>