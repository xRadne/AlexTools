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
				csplit()
				
				Sketchup.send_action('selectSelectionTool:')
			end

			def csplit()
                #
                model = Sketchup.active_model
                ents = model.active_entities
                sel = model.selection
                faces = sel.grep(Sketchup::Face)
                #
                model.start_operation('csplit')
                #
                faces.each do |face|
                    #
                    sum = Geom::Point3d.new(0,0,0)
                    #
                    verts = face.vertices
                    n = verts.size.to_f
                    # use API Geom::Point3d.+ instance method:
                    verts.each {|v| sum += ORIGIN.vector_to(v.position) }
                    #
                    avg = Geom::Point3d.new( sum.x/n, sum.y/n, sum.z/n )
                    #
                    verts.each {|v| ents.add_line( avg, v ) }
                    #
                end # each face
                #
                model.commit_operation
                #
                rescue => e
                #
                puts "Error <#{e.class.name}: #{e.message} >"
                puts e.backtrace if $VERBOSE
                #
                model.abort_operation
                #
                else # when no errors:
                #
                sel.clear
                #
			end # csplit()

		end #class

	end #module

end #module

file_loaded( File.basename(__FILE__) )