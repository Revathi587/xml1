<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!--Declares this document is an XSLT stylesheet.
xmlns:xsl defines the namespace for XSL elements.-->
    <xsl:template match="/">
        <!--/ means whole document-->
        <html>
            <head>
                <title>Library Catalog</title>
                <style>
                    body { font-family: Arial, sans-serif; 
                        margin: 20px; 
                    }
                    .category {
                         background: #f0f0f0; 
                         padding: 15px; 
                         margin: 10px 0; 
                         border-radius: 5px; }
                    .book { 
                        background: white; 
                        padding: 10px; 
                        margin: 10px 0; 
                        border-left: 4px solid #007acc; 
                    }
                    .chapters, .reviews {
                         margin-left: 20px; 
                        }
                    .chapter, .review {
                         padding: 5px; 
                         margin: 2px 0; 
                        }
                    .review { 
                        background: #f9f9f9; 
                    }
                    h1 { 
                        color: #333; 
                    }
                    h2 { 
                        color: #007acc; 
                    }
                    h3 { 
                        color: #555; 
                    }
                </style>
            </head>
            <body>
                <h1>Library Catalog</h1>
                
                <!-- OUTER LOOP: Iterate through categories -->
                <xsl:for-each select="library/category">
                    <div class="category">
                        <h2>Category: <xsl:value-of select="@name"/></h2>
                        
                        <!-- MIDDLE LOOP: Iterate through books in each category -->
                        <xsl:for-each select="book">
                            <div class="book">
                                <h3>
                                    <xsl:value-of select="title"/> 
                                    (<xsl:value-of select="year"/>)
                                </h3>
                                <p><strong>Author:</strong> <xsl:value-of select="author"/></p>
                                <p><strong>ISBN:</strong> <xsl:value-of select="@isbn"/></p>
                                
                                <!-- INNER LOOP 1: Iterate through chapters -->
                                <div class="chapters">
                                    <h4>Chapters:</h4>
                                    <xsl:for-each select="chapters/chapter">
                                        <div class="chapter">
                                            Chapter <xsl:value-of select="@number"/>: 
                                            <xsl:value-of select="."/>
                                            <!--select="." means the current element’s text content.-->
                                        </div>
                                    </xsl:for-each>
                                </div>
                                
                                <!-- INNER LOOP 2: Iterate through reviews -->
                                <div class="reviews">
                                    <h4>Reviews:</h4>
                                    <xsl:for-each select="reviews/review">
                                        <div class="review">
                                            <strong>Rating: <xsl:value-of select="@rating"/>/5</strong><br/>
                                            <xsl:value-of select="."/>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </xsl:for-each>
                    </div>
                </xsl:for-each>
                
                <!-- Summary Statistics -->
                <div class="summary">
                    <h2>Library Summary</h2>
                    <p>Total Categories: <xsl:value-of select="count(library/category)"/></p>
                    <p>Total Books: <xsl:value-of select="count(library/category/book)"/></p>
                    <!--count() counts how many elements exist.-->
                    <!-- Nested loop for book count by category -->
                    <h3>Books by Category:</h3>
                    <xsl:for-each select="library/category">
                        <p>
                            <xsl:value-of select="@name"/>: 
                            <xsl:value-of select="count(book)"/> books
                        </p>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
