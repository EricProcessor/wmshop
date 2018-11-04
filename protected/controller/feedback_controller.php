<?php
class feedback_controller extends general_controller
{
    public function action_feedback(){
        $code = request("code", "");
       // echo $code;
        $this->code = $code;
        $this->compiler('feedback.html');
    }
    public function action_support(){
      //  $user_id = $this->is_logined();
        if(request('step') == 'submit')
        {
            $data = array
            (
                'user_id' => '1',
                'type' => (int)request('type', 0),
                'subject' => trim(strip_tags(request('subject', ''))),
                'content' => trim(strip_tags(request('content', ''))),
                'mobile' => trim(request('email', '')),
                'code' => request('code',''),
                'created_date' => $_SERVER['REQUEST_TIME'],
                'status' => 0,
            );

            $feedback_model = new feedback_model();
            $verifier = $feedback_model->verifier($data);
            if(TRUE === $verifier)
            {
                $feedback_model->create($data);
                $this->action_auth();
                $this->prompt('success', '提交成功', url('main', 'index'));
            }
            else
            {
                $this->prompt('error', $verifier);
            }
        }
        else
        {
            $feedback_model = new feedback_model();
            $this->type_map = $feedback_model->type_map;
            $this->status_map = $feedback_model->status_map;
            $this->compiler('user_feedback_apply.html');
        }
    }

    public function action_auth()
    {
        //$user_id = $this->is_logined();
        $email = request('email', $GLOBALS['cfg']['site_email']);
      //  $email = ''
        if(verifier::is_required($email, TRUE) && verifier::is_email($email, TRUE))
        {
            $tpl_id = 'mail_zixun';
            $limit_model = new sendmail_limit_model();
            if($limit_model->check_counts($tpl_id, 1))
            {
                $captcha = str_shuffle(random_chars(4, TRUE).random_chars(2));
                $_SESSION['EMAIL_AUTH']['EMAIL'] = $email;
                $_SESSION['EMAIL_AUTH']['CAPTCHA'] = strtolower($captcha);
                $_SESSION['EMAIL_AUTH']['EXPIRES'] = $_SERVER['REQUEST_TIME'] + 3600;

                $tpl_model = new email_tpl_model();
                $tpl_model->send_mail('mail_zixun',$email,$captcha);
//                if($tpl_model->send_captcha($email, $captcha))
//                {
//                    $limit_model->increase($tpl_id, 1);
                   $res = array('status' => 'success');
//                }
//                else
//                {
//                    $res = array('status' => 'error', 'msg' => '发送邮件失败，请与网站管理员联系!');
//                }
            }
            else
            {
                $res = array('status' => 'error', 'msg' => '抱歉！您今日发送该邮件次数已超上限!');
            }
        }
        else
        {
            $res = array('status' => 'error', 'msg' => '邮箱地址无效');
        }
        echo json_encode($res);
    }
    public function action_list()
    {
        $user_id = $this->is_logined();
        $feedback_model = new feedback_model();
        $this->feedbacks = array
        (
            'list' => $feedback_model->find_all(array('user_id' => $user_id), 'created_date DESC', 'fb_id, type, subject, created_date, status', array(request('page', 1), 10, 10)),
            'paging' => $feedback_model->page,
        );
        $this->type_map = $feedback_model->type_map;
        $this->status_map = $feedback_model->status_map;
        $this->compiler('user_feedback_list.html');
    }
    
    public function action_view()
    {
        $user_id = $this->is_logined();
        $fb_id = (int)request('id', 0);
        $feedback_model = new feedback_model();
        if($feedback = $feedback_model->find(array('fb_id' => $fb_id, 'user_id' => $user_id)))
        {
            $feedback['type_text'] = $feedback_model->type_map[$feedback['type']];
            $feedback['status_text'] = $feedback_model->status_map[$feedback['status']];
            $this->feedback = $feedback;
            $message_model = new feedback_message_model();
            $this->message_list = $message_model->find_all(array('fb_id' => $fb_id), 'dateline ASC');
            $this->compiler('user_feedback_details.html');
        }
        else
        {
            jump(url('main', '404'));
        }
    }
    
    public function action_apply()
    {
        $user_id = $this->is_logined();
        if(request('step') == 'submit')
        {
            $data = array
            (
                'user_id' => $user_id,
                'type' => (int)request('type', 0),
                'subject' => trim(strip_tags(request('subject', ''))),
                'content' => trim(strip_tags(request('content', ''))),
                'mobile' => trim(request('mobile', '')),
                'created_date' => $_SERVER['REQUEST_TIME'],
                'status' => 0,
            );
                
            $feedback_model = new feedback_model();
            $verifier = $feedback_model->verifier($data);
            if(TRUE === $verifier)
            {
                $feedback_model->create($data);
                $this->prompt('success', '提交成功', url('feedback', 'list'));
            }
            else
            {
                $this->prompt('error', $verifier);
            }
        }
        else
        {
            $feedback_model = new feedback_model();
            $this->type_map = $feedback_model->type_map;
            $this->status_map = $feedback_model->status_map;
            $this->compiler('user_feedback_apply.html');
        }
    }
    
    public function action_messaging()
    {
        $user_id = $this->is_logined();
        $fb_id = (int)request('id', 0);
        $feedback_model = new feedback_model();
        if($feedback_model->find(array('fb_id' => $fb_id, 'user_id' => $user_id, 'status' => 1)))
        {
            $data = array
            (
                'fb_id' => $fb_id,
                'content' => trim(strip_tags(request('content', '', 'post'))),
                'dateline' => $_SERVER['REQUEST_TIME'],
            );
                        
            $message_model = new feedback_message_model();
            $verifier = $message_model->verifier($data);
            if(TRUE === $verifier)
            {
                $message_model->create($data);
                $this->prompt('success', '发送消息成功', url('feedback', 'view', array('id' => $fb_id)));
            }
            else
            {
                $this->prompt('error', $verifier);
            }
        }
        else
        {
            jump(url('main', '404'));
        }
    }
}
