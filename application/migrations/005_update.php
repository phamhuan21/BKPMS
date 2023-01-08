<?php defined('BASEPATH') OR exit('No direct script access allowed');
// v4.1
class Migration_update extends CI_Migration {

	public function __construct() {
		parent::__construct();
		$this->load->dbforge();
	}

	public function up() {  

		$this->dbforge->add_field(array(
				'id' => array(
						'type' => 'INT',
						'auto_increment' => TRUE
				),
				'leave_reason' => array(
					'type' => 'TEXT',
				),
				'user_id' => array(
					'type' => 'INT',
				),
				'leave_days' => array(
					'type' => 'INT',
				),
				'starting_date' => array(
                    'type' => 'DATE',
				),
				'ending_date' => array(
                    'type' => 'DATE',
				),
				'status' => array(
					'type' => 'INT',
				),
				'created timestamp default current_timestamp',
		));
		$this->dbforge->add_key('id', TRUE);
		$this->dbforge->create_table('leaves');

		$this->dbforge->add_field(array(
				'id' => array(
						'type' => 'INT',
						'auto_increment' => TRUE
				),
				'project_id' => array(
					'type' => 'INT',
				),
				'task_id' => array(
					'type' => 'INT',
				),
				'user_id' => array(
					'type' => 'INT',
				),
				'note' => array(
					'type' => 'TEXT',
				),
				'starting_time' => array(
					'type' => 'datetime',
                    'null' => TRUE,
				),
				'ending_time' => array(
					'type' => 'datetime',
                    'null' => TRUE,
				),
				'created timestamp default current_timestamp',
		));
		$this->dbforge->add_key('id', TRUE);
		$this->dbforge->create_table('timesheet');

		
		$this->dbforge->add_field(array(
			'id' => array(
					'type' => 'INT',
					'auto_increment' => TRUE
			),
			'description' => array(
				'type' => 'TEXT',
			),
			'date' => array(
				'type' => 'DATE',
			),
			'amount' => array(
				'type' => 'TEXT',
			),
			'team_member_id' => array(
				'type' => 'INT',
				'null' => TRUE,
			),
			'client_id' => array(
				'type' => 'INT',
				'null' => TRUE,
			),
			'project_id' => array(
				'type' => 'INT',
				'null' => TRUE,
			),
			'receipt' => array(
				'type' => 'TEXT',
			),
			'created timestamp default current_timestamp',
		));
		$this->dbforge->add_key('id', TRUE);
		$this->dbforge->create_table('expenses');

		$this->dbforge->add_field(array(
			'id' => array(
					'type' => 'INT',
					'auto_increment' => TRUE
			),
			'saas_id' => array(
				'type' => 'INT',
			),
			'title' => array(
				'type' => 'TEXT',
			),
			'tax' => array(
				'type' => 'TEXT'
			),
			'created timestamp default current_timestamp',
		));
		$this->dbforge->add_key('id', TRUE);
		$this->dbforge->create_table('taxes');

		
		$this->dbforge->add_field(array(
			'id' => array(
					'type' => 'INT',
					'auto_increment' => TRUE
			),
			'created_by' => array(
				'type' => 'INT',
			),
			'from_id' => array(
				'type' => 'INT',
			),
			'to_id' => array(
				'type' => 'INT',
			),
			'items_id' => array(
				'type' => 'TEXT',
			),
			'amount' => array(
				'type' => 'TEXT',
			),
			'note' => array(
				'type' => 'TEXT',
			),
			'status' => array(
				'type' => 'INT',
				'default' => 0,
			),
			'tax' => array(
				'type' => 'TEXT',
			),
			'invoice_date' => array(
				'type' => 'DATE',
			),
			'due_date' => array(
				'type' => 'DATE',
			),
			'payment_type' => array(
				'type' => 'TEXT',
			),
			'payment_date' => array(
				'type' => 'DATE',
			),
			'created timestamp default current_timestamp',
		));
		$this->dbforge->add_key('id', TRUE);
		$this->dbforge->create_table('invoices');

		$fields = array(
			'budget' => array(
				'type' => 'TEXT',
				'null' => TRUE,
				'default' => NULL,
			)
		);
		$this->dbforge->add_column('projects', $fields);

		$this->db->where('id=2');
		$this->db->delete('time_formats');

		$this->db->where('id=3');
		$this->db->delete('time_formats');

        $this->db->set('js_format', 'hh:MM A');
        $this->db->where('id', 1);
        $this->db->update('time_formats');

	}

	public function down() {
	}
}
