# <%= admin_area do %>  
#   <%= link_to "Edit", edit_product_path(@product) %> |   
#   <%= link_to "Destroy", @product, :confirm => "Are you sure?", :method => :delete %> |   
#   <%= link_to "View All", products_path %>  
# <% end %> 

# def admin_area(&block)  
#   concat('<div class="admin">', block.binding)  
#   block.call  
#   concat("</div>", block.binding)  
# end


# <p>  
#   <%= link_to "Edit", edit_product_path(@product) %> |   
#   <%= link_to "Destroy", @product, :confirm => "Are you sure?", :method => :delete %> |   
#   <%= link_to "View All", products_path %>  
# </p> 


The admin_area method will add the div tag and show or hide the links depending on whether the current user is an admin. Note that because our helper method outputs to the view we’ve used an equals sign in its opening tag.

We’ll define the method inside the application helper. What’s nice about this new way of working with blocks in helper methods is that it behaves like you would expect it to so if the method just returns a string then that string will be output in the view.


# module ApplicationHelper  
#   def admin_area(&block)  
#     "OH HAI!"  
#   end  
# end 

In order to execute the block and return the content we need to call a new method called with_output_buffer and pass it the block. This will call the block in a separate output buffer so that the content isn’t rendered out directly to the view. We can assign that output to a variable and then do whatever we like with it. We want to wrap the content in a div with a class of admin so we’ll change our admin_area method to look like this:

   def admin_area(&block)  
      content = with_output_buffer(&block)  
      content_tag(:div, content, :class => 'admin')  
    end  


<div class="admin">
  <a href="/products/1/edit">Edit</a> | 
  <a href="/products/1" data-confirm="Are you sure?" data-method="delete" rel="nofollow">Destroy</a> | 
  <a href="/products">View All</a>
</div>


def admin_area(&block)  
 content_tag(:div, :class => 'admin', &block)  
end  



def admin_area(&block)  
 content_tag(:div, :class => 'admin', &block) if admin?  
end  


<!-- projects/index.rhtml -->
<% content_for :head do %>
  <%= stylesheet_link_tag 'projects' %>
<% end %>

<!-- layouts/application.rhtml -->
<head>
  <title>Todo List</title>
  <%= stylesheet_link_tag 'application' %>
  <%= yield :head %>
</head>


