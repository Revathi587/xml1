<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Output HTML -->
  <xsl:output method="html" indent="yes"/>

  <!-- Root Template -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Book Information</title>
        <style>
          body { font-family: Arial, sans-serif; margin: 20px; }
          h1 { color: #336699; }
          table { border-collapse: collapse; width: 100%; margin-bottom: 20px; }
          th, td { border: 1px solid #999; padding: 8px; text-align: left; }
          th { background-color: #f2f2f2; }
          tr:nth-child(even) { background-color: #f9f9f9; }
        </style>
      </head>
      <body>
        <h1>Book Information</h1>

        <!-- Book Info Table -->
        <table>
          <tr><th>Field</th><th>Value</th></tr>
          <xsl:for-each select="root/BookInfo/*">
            <tr>
              <td><xsl:value-of select="name()"/></td>
              <td><xsl:value-of select="."/></td>
            </tr>
          </xsl:for-each>
        </table>

        <h2>Chapters</h2>
        <table>
          <tr>
            <th>Chapter</th>
            <th>Chapter Identifier</th>
            <th>Copyright</th>
            <th>Page</th>
            <th>Item Type</th>
            <th>Chapter Order</th>
          </tr>
          <xsl:for-each select="root/Chapterinfo">
            <tr>
              <td><xsl:value-of select="chapter"/></td>
              <td><xsl:value-of select="ChapterIdentifier"/></td>
              <td><xsl:value-of select="copyright"/></td>
              <td><xsl:value-of select="page"/></td>
              <td><xsl:value-of select="ItemType"/></td>
              <td><xsl:value-of select="ChapterOrder"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
