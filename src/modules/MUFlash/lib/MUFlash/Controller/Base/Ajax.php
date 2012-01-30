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
 * Ajax controller class.
 */
class MUFlash_Controller_Base_Ajax extends Zikula_Controller_AbstractAjax
{



    /**
     * This method is the default function, and is called whenever the application's
     * Ajax area is called without defining arguments.
     *
     * @return mixed Output.
     */
    public function main($args)
    {
// DEBUG: permission check aspect starts
        $this->throwForbiddenUnless(SecurityUtil::checkPermission('MUFlash::', '::', ACCESS_OVERVIEW));
// DEBUG: permission check aspect ends

    }


    /**
     * Checks whether a field value is a duplicate or not.
     *
     * @param string $ot       Treated object type.
     * @param string $fragment The fragment of the entered item name.
     * @param string $exclude  Comma separated list with ids of other items (to be excluded from search).
     *
     * @throws Zikula_Exception If something fatal occurs.
     *
     * @return Zikula_Response_Ajax_Base
     */
    public function checkForDuplicate()
    {
        $this->checkAjaxToken();
        $this->throwForbiddenUnless(SecurityUtil::checkPermission($this->name . '::', '::', ACCESS_EDIT));

        $objectType = $this->request->getPost()->filter('ot', 'movie', FILTER_SANITIZE_STRING);
        if (!in_array($objectType, MUFlash_Util_Controller::getObjectTypes('controllerAction', array('controller' => 'ajax', 'action' => 'checkForDuplicate')))) {
            $objectType = MUFlash_Util_Controller::getDefaultObjectType('controllerAction', array('controller' => 'ajax', 'action' => 'checkForDuplicate'));
        }

        $fieldName = $this->request->getPost()->filter('fn', '', FILTER_SANITIZE_STRING);
        $value = $this->request->getPost()->get('v', '');

        if (empty($fieldName) || empty($value)) {
            return new Zikula_Response_Ajax_BadData($this->__('Error: invalid input.'));
        }

        // check if the given field is existing and unique
        $uniqueFields = array();
        switch ($objectType) {
            case 'movie':
                    $uniqueFields = array('title', 'flashFile');
                    break;
        }
        if (!count($uniqueFields) || !in_array($fieldName, $uniqueFields)) {
            return new Zikula_Response_Ajax_BadData($this->__('Error: invalid input.'));
        }

        $exclude = (int) $this->request->getPost()->filter('ex', 0, FILTER_VALIDATE_INT);

        $entityClass = 'MUFlash_Entity_' . ucfirst($objectType);
        $object = new $entityClass(); 

        $result = false;
        switch ($objectType) {
            case 'movie':
                    switch ($fieldName) {
                        case 'title':
                                $result = $object->get_validator()->checkIfTitleExists($value, $exclude);
                                break;
                        case 'flashFile':
                                $result = $object->get_validator()->checkIfFlashFileExists($value, $exclude);
                                break;
                    }
                    break;
        }

        // return response
        return new Zikula_Response_Ajax(array('isDuplicate' => $result));
    }
}