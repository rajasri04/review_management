class Message < ActiveRecord::Base
   belongs_to :sent_by_student, class_name: "Student", primary_key: "email", foreign_key: "from"
   belongs_to :received_by_student, class_name: "Student", primary_key: "email", foreign_key: "to"
   belongs_to :sent_by_staff, class_name: "Staff", primary_key: "email", foreign_key: "from"
   belongs_to :received_by_staff, class_name: "Staff", primary_key: "email", foreign_key: "to"

   def project_name
      JSON.parse(content).dig("meta","project_name") if content.present?
   end
   def project_description
       JSON.parse(content).dig("meta","project_des") if content.present?
   end
   def abs_file

  end
end
