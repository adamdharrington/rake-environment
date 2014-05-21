rake-environment
================

Description
-------------
Some rake tasks to help prepare a static website environment (image processing, Less &amp; Markdown compilation etc)

**Not production ready.**

Rationale
----------------
The rationale is centred on the creation of non-database dependent websites (not apps) which do not run on any sort of Rack or Node server to facilitate the benefits of task automation in the development environment.

The following tasks have been identified as being of benefit for this purpose:
- Resizing images to a variety of dimensions for optimisation
- Compiling of Less or Sass, Coffeescript and Markdown to their respective Web-ready equivalents.
- Preparation of a JSON data object that can be used to reference content.

It is anticipated that further tasks will also prove useful in later iterations.

Structure
-------------------
Directories beginning with an underscore like `_imageinbox` are for pre-processing.

The `_scripts` directory should hold scripts containing modules which perform generic functions in line with the description; specifically compilation into the public directory in preparation of production into a static website.


