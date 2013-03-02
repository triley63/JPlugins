<?php

defined ( '_JEXEC' ) or die;

?>

<h1 id="name"><?php echo $this->escape($this->item->name) ?></h1>

<div id="course">
    <div id="course_left">
        <p id="course_description">
            <?php echo $this->item->description ?>
        </p>
        <p align="right">
            <?php     
                $url = "";
                $link = "";
                if ($this->item->trainingID != 0)
                {
                    $url = 'index.php?option=com_training&view=' . strtolower($this->escape($this->item->type)) . 
                            '&type=' . strtolower(str_replace(" ", "", $this->escape($this->item->style))) . 
                            '&id=' . $this->escape($this->item->trainingID) .
                            '&cont=';
                    
                    if ($this->item->active == 1)
                    {
                        $link = 'Continue Training';
                        $url .= '1';
                    }
                    else
                    {
                        $link = 'Begin Training';
                        $url .= '0';
                    }
          
                }
            ?>
            <a href="<?php echo JRoute::_($url); ?>"><?php echo $link; ?></a>
        </p>
    </div>
</div>
