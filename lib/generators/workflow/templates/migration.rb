class CreateWorkflowTabels < ActiveRecord::Migration
	def change
		create_table :work_categories, comment: "定义哪些Model有流程控制及流程的列名是什么" do |t|
			t.string :name, comment: "记录模型名称，如：Contract"
			t.string :column_name, comment: "记录字段名称，如：state"

			t.timestamps
		end

		create_table :work_items, comment: "记录流程中的节点" do |t|
			t.string :action, comment: "节点"
			t.string :display, comment: "节点显示名称"
			t.integer :work_category_id, comment: "节点属于哪个模型"

			t.timestamps
		end

		create_table :work_events, comment: "流程事件" do |t|
			t.string :event_name, comment: "事件名称"
			t.string :from, comment: "原节点名称"
			t.string :to, comment: "更改后的事件名称"
			t.string :on_transitions, comment: "事件相关的动作"
			t.integer :work_category_id

			t.timestamps
		end

		create_table :work_processes, comment: "流程进程" do |t|
			t.integer :target_id, comment: "多太关联，记录是哪个实例产生的流程"
			t.string :target_type
			t.string :event_name

			t.timestamps
		end

	end
end