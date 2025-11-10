<?xml version="1.0" encoding="UTF-8"?>
<!--If“UTF” stands for Unicode Standard Transformation Format. 
It refers to a way of encoding characters (letters, symbols, etc.) defined by Unicode into bytes for storage or transmission.
<xsl:stylesheet version="1.0"-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--xmlns:xsl defines the namespace for all XSL elements (so the processor knows they’re transformation instructions, not normal XML tags).-->
    <xsl:template match="/">
        <html>
            <head>
                <title>Keywords with Key-Value Pairs</title>
                <style>
                    body { 
                        font-family: Arial, sans-serif; 
                        margin: 20px; 
                        background: #f5f5f5;
                    }
                    .container {
                        max-width: 800px;
                        margin: 0 auto;
                        background: white;
                        padding: 20px;
                        border-radius: 10px;
                        box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                    }
                    h1 { 
                        color: #333; 
                        text-align: center;
                        border-bottom: 2px solid #007acc;
                        padding-bottom: 10px;
                    }
                    .keyword-item {
                        background: #f8f9fa;
                        margin: 10px 0;
                        padding: 15px;
                        border-radius: 8px;
                        border-left: 4px solid #007acc;
                    }
                    .key {
                        font-weight: bold;
                        color: #333;
                        display: inline-block;
                        width: 150px;
                    }
                    .value {
                        padding: 5px 10px;
                        border-radius: 4px;
                        background: #e9ecef;
                    }
                    .value-datascience {
                        color: green;
                        font-weight: bold;
                        background: #d4edda;
                        border: 1px solid #c3e6cb;
                    }
                    .summary {
                        margin-top: 20px;
                        padding: 15px;
                        background: #e7f3ff;
                        border-radius: 8px;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Keyword-Value Pairs</h1>
                    
                    <!-- FOR-EACH LOOP: Iterate through all keywords -->
                    <xsl:for-each select="keywords/keyword">
                        <div class="keyword-item">
                            <span class="key">
                                <xsl:value-of select="key"/>:
                            </span>
                            
                            <!-- Apply green color only for "datascience" values -->
                            <xsl:choose>
                                <!--<xsl:choose> works like an if-else statement.
If the <value> text equals “datascience”, use the special green style.-->
                                <xsl:when test="value = 'datascience'">
                                    <span class="value value-datascience">
                                        <xsl:value-of select="value"/>
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <span class="value">
                                        <xsl:value-of select="value"/>
                                    </span>
                                </xsl:otherwise>
                            </xsl:choose>
                        </div>
                    </xsl:for-each>
                    
                    <!-- Summary Section -->
                    <div class="summary">
                        <h2>Summary</h2>
                        <p>Total Keywords: <strong><xsl:value-of select="count(keywords/keyword)"/></strong></p>
                        <p>Datascience Entries: 
                            <strong style="color: green;">
                                <xsl:value-of select="count(keywords/keyword[value='datascience'])"/>
                                <!--ses the count() XPath function to count all <keyword> elements.-->
                            </strong>
                        </p>
                    </div>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>