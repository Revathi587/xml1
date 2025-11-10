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
            font-family: Georgia, serif;
            background-color: #f4f1ec;
            color: #2e2e2e;
            margin: 50px;
        }
        .book {
            max-width: 800px;
            margin: auto;
            background-color: #fffaf3;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #5b3924;
        }
        ul {
            list-style-type: disc;
            padding-left: 30px;
        }
        li {
            margin-bottom: 5px;
            font-weight: bold;
        }
        .green {
            color: green;
        }
        .yellow {
            color: goldenrod;
        }
    </style>
</head>

<body>
<div class="book">
    <h1><xsl:value-of select="book/title"/></h1>
    <p><strong>Author:</strong> <xsl:value-of select="book/author"/></p>
    <p><strong>Publisher:</strong> <xsl:value-of select="book/publisher"/></p>
    <p><strong>Year:</strong> <xsl:value-of select="book/year"/></p>
    <hr/>
    <h3>Book Content:</h3>
    <xsl:for-each select="book/content/chapter">
        <h4><xsl:value-of select="title"/></h4>
        <p><xsl:value-of select="text"/></p>
    </xsl:for-each>
    <hr/>
    <h3>Keywords:</h3>
    <!-- Using IF-ELSE (xsl:choose) -->
    <ul>
        <xsl:for-each select="book/keywords/keyword">
            <xsl:choose>
                <!-- IF condition -->
                <xsl:when test=". = 'Data Science'">
                    <li class="green"> 
                        <xsl:value-of select="."/>
                        <!-- Message to explain during demo -->
                        <span style="font-size:0.85em;"></span>
                    </li>
                </xsl:when>
                <!-- ELSE condition -->
                <xsl:otherwise>
                    <li class="yellow">
                        <xsl:value-of select="."/>
                    </li>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </ul>

    <!-- Additional visible explanation of condition -->
    <hr/>
    <h4>Conditional Check Summary:</h4>
    <xsl:if test="book/keywords/keyword = 'Data Science'">
        <p style="color:green; font-weight:bold;">
              The keyword 'Data Science' is present in the list.
        </p>
    </xsl:if>
    <xsl:if test="not(book/keywords/keyword = 'Data Science')">
        <p style="color:red; font-weight:bold;">
              The keyword 'Data Science' is not present.
        </p>
    </xsl:if>

</div>
</body>
</html>
</xsl:template>
</xsl:stylesheet>