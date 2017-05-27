ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do
      column do
        panel "Recent Volunteers" do
          table_for Volunteer.all.limit(5) do
            column("Firstname")   {|volunteer| volunteer.firstname }
            column("Lastname"){|volunteer| volunteer.lastname }
            column("Email")   {|volunteer| volunteer.email }
            column("See details")   {|volunteer| link_to("See",  "/admin/volunteers/#{volunteer.id}") }
          end
        end
      end
    end

    columns do
      column do
        panel "Recent Projects" do
          table_for Project.all.limit(5) do
            column("Title")   {|project| project.title }
            column("Status"){|project| project.status }
            column("See details")   {|project| link_to("See", "/admin/projects/#{project.id}") }
          end
        end
      end

    end
  end
end
