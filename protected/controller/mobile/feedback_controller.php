<?php
class feedback_controller extends general_controller
{
    public function action_list()
    {
        $user_id = $this->is_logined();
        $this->compiler('user_feedback_list.html');
    }
    
    public function action_apply()
    {
        $user_id = $this->is_logined();
        $this->compiler('user_feedback_apply.html');
    }
    public function action_support()
    {
       // $user_id = $this->is_logined();
        $code = request("code", "");
        // echo $code;
        $this->code = $code;
        $this->compiler('feedback.html');
    }
    
    public function action_view()
    {
      //  $user_id = $this->is_logined();
        $fb_id = (int)request('id', 0, 'get');
        $feedback_model = new feedback_model();

        if($feedback = $feedback_model->find(array('fb_id' => $fb_id, 'user_id' => 1)))
        {

            $feedback[ 'mobile' ] = trim(request('email', ''));
            json_encode($feedback);
           // $feedback['type'] = $feedback_model->type_map[$feedback['type']];
           // $this->feedback = $feedback;
           // $message_model = new feedback_message_model();
           // $this->message_list = $message_model->find_all(array('fb_id' => $fb_id), 'dateline ASC');

           // $this->compiler('user_feedback_details.html');
        }
        else
        {
            jump(url('mobile/main', '404'));
        }
    }
    public function action_feedback()
    {
        //  $user_id = $this->is_logined();
        $fb_id = (int)request('id', 0, 'get');
        $feedback_model = new feedback_model();
        if($feedback = $feedback_model->find(array('fb_id' => $fb_id, 'user_id' => 1)))
        {
            $feedback['type'] = $feedback_model->type_map[$feedback['type']];
            $this->feedback = $feedback;
            $message_model = new feedback_message_model();
            $this->message_list = $message_model->find_all(array('fb_id' => $fb_id), 'dateline ASC');

            $this->compiler('index.html');
        }
        else
        {
            jump(url('mobile/main', '404'));
        }
    }
}