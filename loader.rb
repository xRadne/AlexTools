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
Name:: AlexTool
Version:: 1.0.0
SU Version:: 2018
Date:: 2018-03-26
Description:: Split faces up into triangles.
=end

module ALEX_Extensions

	module ALEX_Tool

		class FaceSplit

			def initialize()
				point1 = [0,0,0]
                point2 = [100,100,100]
                model = Sketchup.active_model
                entities = model.active_entities
                entities.add_edges(point1, point2)
			end #initialize

		end #FaceSplit

	end #ALEX_Tool

end #ALEX_Extensions

file_loaded( File.basename(__FILE__) )