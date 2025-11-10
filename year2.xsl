<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8"/>

  <xsl:template match="/">
    <html>
      <head>
        <title>Book List</title>
        <style type="text/css">
          body { font-family: Arial, sans-serif; margin: 20px; background-color: #f5f5f5; }
          h1 { color: #003366; text-align: center; margin-bottom: 20px; }
          table { width: 100%; border-collapse: collapse; }
          th { background-color: #003366; color: white; padding: 12px; text-align: left; border: 1px solid #cccccc; }
          td { padding: 10px; border: 1px solid #cccccc; background-color: #ffffff; }
          .year2024 td { background-color: #d0e8ff; }
        </style>
      </head>
      <body>
        <h1>Book List</h1>
        <table>
          <tr>
            <!-- Custom headers -->
            <th>Title</th>
            <th>Author</th>
            <th>Department</th>
            <th>ISBN</th>
            <th>Year</th>
            <th>Edition</th>
          </tr>

          <!-- Loop through each book -->
          <xsl:for-each select="books/book">
            <xsl:variable name="yr" select="year"/>
            <tr>
              <!-- Highlight books from 2024 -->
              <xsl:if test="$yr = '2024'">
                <xsl:attribute name="class">year2024</xsl:attribute>
              </xsl:if>

              <!-- Table data -->
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="department"/></td>
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
