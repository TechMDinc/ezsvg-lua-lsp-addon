---@meta


---
---Create SVG images dynamically. [Open in Browser](https://github.com/cappelnord/EzSVG/)
---
---@class EzSVG
local EzSVG = {}


---@class Container
local Container = {}


---@class Element
local Element = {}


---
---Add/change style properties of the element with a key/value table.
---[Available Style Properties](http://www.w3.org/TR/SVG/styling.html#SVGStylingProperties)
---
---@param style table
function Element:setStyle(style) end


---
---Add/change style properties of the element for a single key and value.
---[Available Style Properties](http://www.w3.org/TR/SVG/styling.html#SVGStylingProperties)
---
---@param key string
---@param value string|number
function Element:setStyle(key, value) end


---
---Only adds style properties to the element. Already set properties are not overwritten.
---
---@param style table
function Element:mergeStyle(style) end


---
---Only adds the style property to the element. Already set properties are not overwritten.
---
---@param key string
---@param value string|number
function Element:mergeStyle(key, value) end


---
---Clears the style of the element.
---
function Element:clearStyle() end


---@class Poly: Element
local Poly = {}


---
---Adds an element to the group.  No copy of the element is made, and all changes to the element are still
---affecting the element in the group.
---
---@param element Element|Container
function Container:add(element) end


---@class Document: Container
local Document = {}
---@class Group: Container
local Group = {}


---
---Creates the root <svg> document with specified width and height.  If a bgcolor is given, a Rect of the
---same size is added automatically.
---
---@param width number
---@param height number
---@param bgcolor? string
---@param style? table
---@return Document
function EzSVG.Document(width, height, bgcolor, style) end


---
---The writeTo method renders the SVG document to a file with the specified filename.
---
---@param filename string
function Document:writeTo(filename) end


---
---Creates an empty <svg> element. Its content can be embedded into another SVG document, but this element
---cannot render to a file (use EzSVG.Document instead).
---
---@param x number The X position
---@param y number The Y position
---@param width number
---@param height number
---@param style? table
---@return Container
function EzSVG.SVG(x, y, width, height, style) end


---
---Creates an empty <g> group element. Groups will also be groups in vector graphics programs such as
---Inkscape. Groups can be used in conjunction with EzSVG.Use to create elements that are repeated throughout
---the document.
---
---@param style? table
---@return Container
function EzSVG.Group(style) end


---
---Creates a <circle> with center point cx,cy and radius r.
---
---@param cx number
---@param cy number
---@param r number
---@param style? table
---@return Element
function EzSVG.Circle(cx, cy, r, style) end


---
---Creates an <ellipse> with center point cx,cy and radii rx,ry.
---
---@param cx number
---@param cy number
---@param rx number
---@param ry number
---@param style? table
---@return Element
function EzSVG.Ellipse(cx, cy, rx, ry, style) end


---
---Creates a <rect> with x/y specifying the side of the rectangle which has the smaller y-axis
---coordinate value in the current user coordinate system. width/height specify the dimensions of
---the rectangle. The rx/ry parameters can be used to give the rectangle round corners.
---
---@param x number
---@param y number
---@param width number
---@param height number
---@param rx? number
---@param ry? number
---@param style? table
---@return Element
function EzSVG.Rect(x, y, width, height, rx, ry, style) end


---
---Creates a straight <line> from x1,y1 to x2,y2.
---
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param style? table
---@return Element
function EzSVG.Line(x1, y1, x2, y2, style) end


---
---Creates a <polyline> with the table points as vertices. The points table must have an even size,
---and has the layout {x1, y1, x2, y2, x3, y3, ...}.
---
---@param points table
---@param style? table
---@return Poly
function EzSVG.Polyline(points, style) end


---
---Creates a <polygon> with the table points as vertices. The points table must have an even size,
---and has the layout {x1, y1, x2, y2, x3, y3, …}. The difference between a polygon and a polyline
---is that a polygon closes itself automatically (draws a line to its start point).
---
---@param points table
---@param style? table
---@return Poly
function EzSVG.Polygon(points, style) end


---
---Adds a point to a polygon/polyline element after creation.
---
---@param x number
---@param y number
function Poly:addPoint(x, y) end


---
---RGB color function, takes values in the range 0-255.
---Returns SVG compatible color notation as RGB string.
---
---@param red number
---@param green number
---@param blue number
---@return string
function EzSVG.rgb(red, green, blue) end


---
---Gray value in range 0-255.
---Returns SVG compatible color notation as RGB string.
---
---@param value number
---@return string
function EzSVG.gray(value) end


---
---Hue, saturation, value in range 0-255.
---Returns SVG compatible color notation as RGB string.
---@param hue number
---@param sat number
---@param val number
---@return string
function EzSVG.hsv(hue, sat, val) end


---
---Add/change style properties of the style table for the specified element tag. If no tag is
---specified the style for all tags is changed.
---[Available Style Properties](http://www.w3.org/TR/SVG/styling.html#SVGStylingProperties)
---
---@param style table
---@param tag? string
function EzSVG.setStyle(style, tag) end


---
---Add/change style properties of the style table for the specified element tag. If no tag is
---specified the style for all tags is changed.
---[Available Style Properties](http://www.w3.org/TR/SVG/styling.html#SVGStylingProperties)
---
---@param key string
---@param value string|number
---@param tag? string
function EzSVG.setStyle(key, value, tag) end


---
---Push the current style onto the style stack. Use this to save the current style and return to it
---at a later point.
---
function EzSVG.pushStyle() end


---
---Pop the current style from the style stack.
---
function EzSVG.popStyle() end


return EzSVG
