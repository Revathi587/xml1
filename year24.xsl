<?xml version="1.0" encoding="UTF-8"?>
<!--If“UTF” stands for Unicode Standard Transformation Format. 
It refers to a way of encoding characters (letters, symbols, etc.) defined by Unicode into bytes for storage or transmission.
<xsl:stylesheet version="1.0"-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Book List</title>
        <style type="text/css">
          body { 
            font-family: Arial, sans-serif;
            margin: 20px; 
            background-color: #f5f5f5; 
          }
          h1 { 
            color: #003366; 
            text-align: center; 
            margin-bottom: 20px; 
          }
          table { 
            width: 100%; 
            border-collapse: collapse; 
          }
          th { 
            background-color: #003366; 
            color: white; 
            padding: 12px; 
            text-align: left; 
            border: 1px solid #cccccc; 
          }
          td { 
            padding: 10px; 
            border: 1px solid #cccccc; 
            background-color: #ffffff; 
          }
          .year2024 td { 
            background-color: #d0e8ff; 
          }
        </style>
      </head>
      <body>
        <h1>Book List</h1>
        <table>
          <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Publisher</th>
            <th>ISBN</th>
            <th>Year</th>
            <th>Edition</th>
          </tr>

          <xsl:for-each select="books/book">
            <!--The <xsl:for-each> element is used to iterate (loop) over a set of XML nodes.-->
            <xsl:variable name="yr" select="year"/>
            <tr>
              <xsl:if test="$yr = '2024'">
                <!--The <xsl:if> element lets you add conditional logic — it only processes its content if a certain test is true.-->
                <xsl:attribute name="class">year2024</xsl:attribute>
              </xsl:if>
              <!--If the $yr variable equals "2024", then add an attribute class="year2024" to the <tr> element.
                  That class (.year2024) was defined in CSS to give a light blue background.
                  So — only books from 2024 will have blue-highlighted rows.-->
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="publisher"/></td>
              <td><xsl:value-of select="isbn"/></td>
              <td><xsl:value-of select="year"/></td>
              <td><xsl:value-of select="edition"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
 