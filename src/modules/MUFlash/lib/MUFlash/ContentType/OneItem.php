<?php
/**
 * MUFlash.
 *
 * @copyright Michael Ueberschaer
 * @license http://www.gnu.org/licenses/lgpl.html GNU Lesser General Public License
 * @package MUFlash
 * @author Michael Ueberschaer <kontakt@webdesign-in-bremen.com>.
 * @link http://www.webdesign-in-bremen.com
 * @link http://zikula.org
 * @version Generated by ModuleStudio 0.5.4 (http://modulestudio.de) at Fri Jan 27 19:27:23 CET 2012.
 */

/**
 * Generic item list content plugin base class
 */
class MUFlash_ContentType_OneItem extends Content_AbstractContentType
{
    private $objectType;
    private $id;
    private $template;

    public function getModule()
    {
        return 'MUFlash';
    }

    public function getName()
    {
        return 'OneItem';
    }

    public function getTitle()
    {
        $dom = ZLanguage::getModuleDomain('MUFlash');
        return __('MUFlash item', $dom);
    }

    public function getDescription()
    {
        $dom = ZLanguage::getModuleDomain('MUFlash');
        return __('Display One MUFlash Item.', $dom);
    }

    public function loadData(&$data)
    {
        if (!isset($data['objectType']) || !in_array($data['objectType'], MUFlash_Util_Controller::getObjectTypes('contentType'))) {
            $data['objectType'] = MUFlash_Util_Controller::getDefaultObjectType('contentType');
        }

        if (!isset($data['template'])) {
            $data['template'] = 'oneitem_' . ucwords($this->objectType) . '_display.tpl';
        }
        
        $this->objectType = $data['objectType'];        
        $this->id = $data['id'];
        $this->template = $data['template'];

    }

    public function display()
    {
        $dom = ZLanguage::getModuleDomain('MUFlash');
        ModUtil::initOOModule('MUFlash');

        $serviceManager = ServiceUtil::getManager();
        $entityManager = $serviceManager->getService('doctrine.entitymanager');
        $repository = $entityManager->getRepository('MUFlash_Entity_' . ucfirst($this->objectType));

        // get objects from database
        $selectionArgs = array(
            'ot' => $objectType,
            'id' => $this->id);
        
        $entity = ModUtil::apiFunc('MUFlash', 'selection', 'getEntity', $selectionArgs);

        $this->view->setCaching(true);

        $data = array('objectType' => $this->objectType, 'id' => $this->id, 'template' => $this->template);

        // assign block vars and fetched data
        $this->view->assign('vars', $data)
                   ->assign('objectType', $this->objectType)
                   ->assign('item', $entity)
                   ->assign($repository->getAdditionalTemplateParameters('contentType'));

        $output = '';
        if (!empty($this->template) && $this->view->template_exists('contenttype/' . $this->template)) {
            $output = $this->view->fetch('contenttype/' . $this->template);
        }
        $templateForObjectType = str_replace('oneitem_', 'oneitem_' . ucwords($this->objectType) . '_', $this->template);
        if ($this->view->template_exists('contenttype/' . $templateForObjectType)) {
            $output = $this->view->fetch('contenttype/' . $templateForObjectType);
        } elseif ($this->view->template_exists('contenttype/' . $this->template)) {
            $output = $this->view->fetch('contenttype/' . $this->template);
        } else {
            $output = $this->view->fetch('contenttype/oneitem_Movie_display.tpl');
        }

        return $output;
    }

    public function displayEditing()
    {
        return $this->display();
    }

    public function getDefaultData()
    {
        return array('objectType' => 'movie',
                     'id' => null,
                     'template' => 'oneitem_display.tpl');
    }

    public function startEditing()
    {
        $dom = ZLanguage::getModuleDomain('MUFlash');
        array_push($this->view->plugins_dir, 'modules/MUFlash/templates/plugins');
    }
}