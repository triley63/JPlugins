# Add a menu item
INSERT INTO `#__menu` (
    `menutype`
    ,`title`
    ,`link`
    ,`type`
    ,`published`
    ,`parent_id`
    ,`level`
    ,`component_id`
    ,`params`
    ,`home`
    ,`access`
)
VALUES (
    'mainmenu'
    ,'Training'
    ,'index.php?option=com_training&view=course&id=0'
    ,'url'
    ,1
    ,1
    ,1
    ,0
    ,'{"menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1}'
    ,0
    ,1
)
