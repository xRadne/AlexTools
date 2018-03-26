=begin
(c) 2018, Alexander Radne

Permission to use, copy, modify, and distribute this software for
any purpose and without fee is hereby granted, provided the above
copyright notice appear in all copies.

THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

== Information
Author:: Alexander Radne 
Name:: ToolOne
Version:: 1.0.0
SU Version:: 2018
Date:: 2018-03-26
Description:: Split faces up into triangles.
=end

module XRADNE_Extensions

	module XRADNE_Tool

		class ToolOne

			def initialize()
				model = Sketchup.active_model
                entities = model.active_entities
                selection = model.selection
                edges = selection.grep(Sketchup::Edge)

				point1 = [0,0,0]
                point2 = edges[0].end
				entities.add_edges(point1, point2)
				

				Sketchup.send_action('selectSelectionTool:')
			end #initialize

		end #ToolOne

	end #XRADNE_Tool

end #XRADNE_Extensions

file_loaded( File.basename(__FILE__) )